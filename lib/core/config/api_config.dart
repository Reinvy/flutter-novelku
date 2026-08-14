/// Konfigurasi API global NovelKu.
///
/// Base URL dapat dioverride saat build:
/// `flutter run --dart-define=API_BASE_URL=http://10.0.2.2:3000`
class ApiConfig {
  ApiConfig._();

  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://10.0.2.2:3000',
  );

  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 30);
}
