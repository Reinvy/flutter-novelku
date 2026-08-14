import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_client.dart';
import '../../../core/storage/token_storage.dart';
import '../../../shared/models/user.dart';
import '../../../shared/providers/storage_providers.dart';

/// Response auth dari backend.
class AuthResponse {
  const AuthResponse({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  final User user;
  final String accessToken;
  final String refreshToken;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        user: User.fromJson(json['user'] as Map<String, dynamic>),
        accessToken: json['accessToken'] as String,
        refreshToken: json['refreshToken'] as String,
      );
}

/// Repository auth — satu-satunya tempat memanggil endpoint auth.
class AuthRepository {
  AuthRepository(this._client, this._tokens);

  final ApiClient _client;
  final TokenStorage _tokens;

  Future<AuthResponse> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await _client.dio.post<Map<String, dynamic>>(
      '/auth/register',
      data: {'name': name, 'email': email, 'password': password},
    );
    final data = AuthResponse.fromJson(response.data!);
    await _tokens.saveTokens(access: data.accessToken, refresh: data.refreshToken);
    return data;
  }

  Future<AuthResponse> login({required String email, required String password}) async {
    final response = await _client.dio.post<Map<String, dynamic>>(
      '/auth/login',
      data: {'email': email, 'password': password},
    );
    final data = AuthResponse.fromJson(response.data!);
    await _tokens.saveTokens(access: data.accessToken, refresh: data.refreshToken);
    return data;
  }

  Future<void> logout() async {
    final refreshToken = await _tokens.readRefreshToken();
    if (refreshToken != null) {
      try {
        await _client.dio.post<Map<String, dynamic>>(
          '/auth/logout',
          data: {'refreshToken': refreshToken},
        );
      } catch (_) {
        // Abaikan error saat logout — token lokal tetap dibersihkan.
      }
    }
    await _tokens.clear();
  }

  Future<User?> me() async {
    final response = await _client.dio.get<Map<String, dynamic>>('/auth/me');
    final data = response.data;
    if (data == null) return null;
    return User.fromJson(data['user'] as Map<String, dynamic>);
  }

  Future<bool> hasSession() async {
    final access = await _tokens.readAccessToken();
    final refresh = await _tokens.readRefreshToken();
    return access != null && refresh != null;
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.watch(apiClientProvider), ref.watch(tokenStorageProvider));
});
