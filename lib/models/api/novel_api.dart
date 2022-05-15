import 'package:dio/dio.dart';
// import '../../models/model.dart';

class NovelApi {
  static Future<dynamic> getNovels() async {
    var dio = Dio();
    String baseUrl =
        'https://novelku-9f1c6-default-rtdb.asia-southeast1.firebasedatabase.app/Novel/.json';

    try {
      final response = await dio.get(baseUrl);
      return response;
    } catch (e) {
      return null;
    }
  }

  static Future<void> postNovel(
    String judul,
    String sinopsis,
    String author,
    String status,
    String linkImage,
  ) async {
    var dio = Dio();
    String baseUrl =
        'https://novelku-9f1c6-default-rtdb.asia-southeast1.firebasedatabase.app/Novel/.json';

    var formNovel = {
      'Judul': judul,
      'Sinopsis': sinopsis,
      'author': author,
      'status': status,
      'LinkImage': linkImage,
    };

    try {
      await dio.post(baseUrl, data: formNovel);
    } catch (e) {
      // rethrow;
    }
  }

  static Future<void> updateNovel(String id, String judul, String sinopsis,
      String author, String status, String linkImage) async {
    var dio = Dio();
    String baseUrl =
        'https://novelku-9f1c6-default-rtdb.asia-southeast1.firebasedatabase.app/Novel/$id/.json';

    var formNovel = {
      'Judul': judul,
      'Sinopsis': sinopsis,
      'author': author,
      'status': status,
      'LinkImage': linkImage,
    };

    try {
      await dio.put(
        baseUrl + id,
        data: formNovel,
      );
    } catch (e) {
      // rethrow;
    }
  }

  static Future<void> deleteNovel(String idNovel) async {
    String baseUrl =
        'https://novelku-9f1c6-default-rtdb.asia-southeast1.firebasedatabase.app/Novel/$idNovel/.json';

    try {
      await Dio().delete(baseUrl);
    } catch (e) {
      // rethrow;
    }
  }

  static Future<void> postChapters(
      String idNovel, String judulChapter, String content) async {
    var dio = Dio();
    String baseUrl =
        'https://novelku-9f1c6-default-rtdb.asia-southeast1.firebasedatabase.app/Novel/$idNovel/Chapter.json';
    // String auth = '.json?auth=$idToken';

    var formChapter = {
      'JudulChapter': judulChapter,
      'Content': content,
    };

    dio.post(
      baseUrl,
      data: formChapter,
    );
  }

  static Future<void> deleteChapter(String idNovel, String idChapter) async {
    String baseUrl =
        'https://novelku-9f1c6-default-rtdb.asia-southeast1.firebasedatabase.app/Novel/$idNovel/Chapter/$idChapter.json';

    try {
      await Dio().delete(baseUrl);
    } catch (e) {
      // rethrow;
    }
  }
}
