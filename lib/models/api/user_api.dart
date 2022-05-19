import 'package:dio/dio.dart';

class UserAPI {
  static Future<dynamic> getUser() async {
    var dio = Dio();
    String baseUrl =
        'https://novelku-9f1c6-default-rtdb.asia-southeast1.firebasedatabase.app/User/.json';

    try {
      final response = await dio.get(baseUrl);
      return response;
    } catch (e) {
      return null;
    }
  }

  static Future<void> postUser(
    String uId,
    String nama,
    String email,
    String profileImage,
    String coverImage,
  ) async {
    var dio = Dio();
    String baseUrl =
        'https://novelku-9f1c6-default-rtdb.asia-southeast1.firebasedatabase.app/User/.json';

    var formUser = {
      'uId': uId,
      'nama': nama,
      'email': email,
      'profileImage': profileImage,
      'coverImage': coverImage,
    };

    try {
      await dio.post(baseUrl, data: formUser);
    } catch (e) {
      // rethrow;
    }
  }

  static Future<void> updateProfile(
    String key,
    String uId,
    String nama,
    String email,
    String profileImage,
    String coverImage,
  ) async {
    var dio = Dio();
    String baseUrl =
        'https://novelku-9f1c6-default-rtdb.asia-southeast1.firebasedatabase.app/User/$key.json';

    var formUser = {
      'uId': uId,
      'nama': nama,
      'email': email,
      'profileImage': profileImage,
      'coverImage': coverImage,
    };

    try {
      await dio.put(baseUrl, data: formUser);
      print('Upldate pp');
    } catch (e) {
      // rethrow;
    }
  }
}
