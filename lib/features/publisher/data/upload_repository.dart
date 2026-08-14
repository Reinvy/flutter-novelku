import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/network/api_client.dart';

/// Hasil upload gambar.
class UploadResult {
  const UploadResult({required this.url});

  final String url;
}

/// Repository upload: kompres gambar → kirim multipart → dapat URL.
class UploadRepository {
  UploadRepository(this._client);

  final ApiClient _client;

  Future<XFile?> pickImage() async {
    final picker = ImagePicker();
    return picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1200,
      maxHeight: 1600,
      imageQuality: 80,
    );
  }

  Future<UploadResult> uploadCover(XFile image) async {
    // Kompres lebih lanjut agar hemat bandwidth.
    final compressed = await FlutterImageCompress.compressWithFile(
      image.path,
      quality: 75,
    );
    final bytes = compressed ?? await image.readAsBytes();

    final file = File(image.path);
    final formData = FormData.fromMap({
      'image': MultipartFile.fromBytes(bytes, filename: file.uri.pathSegments.last),
    });

    final response = await _client.dio.post<Map<String, dynamic>>(
      '/uploads/cover',
      data: formData,
    );
    return UploadResult(url: response.data!['url'] as String);
  }
}

final uploadRepositoryProvider = Provider<UploadRepository>(
  (ref) => UploadRepository(ref.watch(apiClientProvider)),
);
