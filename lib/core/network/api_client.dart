import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/api_config.dart';
import '../storage/token_storage.dart';
import 'api_exception.dart';
import '../../shared/providers/storage_providers.dart';

/// Dio singleton dengan interceptor auth + auto-refresh token.
class ApiClient {
  ApiClient._(this._dio, this._tokenStorage);

  final Dio _dio;
  final TokenStorage _tokenStorage;

  static const _retryHeader = 'x-retry-refresh';

  static ApiClient create(TokenStorage storage) {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: ApiConfig.connectTimeout,
        receiveTimeout: ApiConfig.receiveTimeout,
        headers: {'Accept': 'application/json'},
      ),
    );

    final client = ApiClient._(dio, storage);
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) => client._onRequest(options, handler),
        onError: (error, handler) => client._onError(error, handler),
      ),
    );

    return client;
  }

  Dio get dio => _dio;

  Future<void> _onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final access = await _tokenStorage.readAccessToken();
    if (access != null && !options.headers.containsKey('Authorization')) {
      options.headers['Authorization'] = 'Bearer $access';
    }
    handler.next(options);
  }

  Future<void> _onError(DioException error, ErrorInterceptorHandler handler) async {
    final isAuthCall = error.requestOptions.path.contains('/auth/');
    final alreadyRetried = error.requestOptions.extra[_retryHeader] == true;

    if (error.response?.statusCode == 401 && !isAuthCall && !alreadyRetried) {
      final refreshed = await _tryRefresh();
      if (refreshed) {
        final options = error.requestOptions;
        options.extra[_retryHeader] = true;
        final access = await _tokenStorage.readAccessToken();
        if (access != null) {
          options.headers['Authorization'] = 'Bearer $access';
        }
        try {
          final response = await _dio.fetch(options);
          handler.resolve(response);
          return;
        } on DioException catch (retryError) {
          handler.next(retryError);
          return;
        }
      }
      // Refresh gagal → sesi berakhir.
      await _tokenStorage.clear();
      handler.next(error);
      return;
    }

    handler.next(error);
  }

  Future<bool> _tryRefresh() async {
    final refreshToken = await _tokenStorage.readRefreshToken();
    if (refreshToken == null) return false;

    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/auth/refresh',
        data: {'refreshToken': refreshToken},
        options: Options(extra: {_retryHeader: true}),
      );
      final data = response.data;
      if (data == null) return false;
      await _tokenStorage.saveTokens(
        access: data['accessToken'] as String,
        refresh: data['refreshToken'] as String,
      );
      return true;
    } catch (_) {
      return false;
    }
  }
}

/// Helper untuk mengubah DioException menjadi ApiException di repository layer.
ApiException mapDioError(Object error) {
  if (error is DioException) {
    if (error.type == DioExceptionType.connectionError ||
        error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return ApiException(
        message: 'Tidak dapat terhubung ke server. Periksa koneksi internet Anda.',
      );
    }
    final data = error.response?.data;
    if (data is Map<String, dynamic>) {
      final errorBody = data['error'];
      if (errorBody is Map<String, dynamic>) {
        return ApiException(
          message: errorBody['message'] as String? ?? 'Terjadi kesalahan',
          statusCode: error.response?.statusCode,
          code: errorBody['code'] as String?,
          details: errorBody['details'],
        );
      }
    }
    return ApiException(
      message: error.message ?? 'Terjadi kesalahan',
      statusCode: error.response?.statusCode,
    );
  }
  return ApiException(message: 'Terjadi kesalahan');
}

final apiClientProvider = Provider<ApiClient>((ref) {
  final storage = ref.watch(tokenStorageProvider);
  return ApiClient.create(storage);
});

final dioProvider = Provider<Dio>((ref) => ref.watch(apiClientProvider).dio);
