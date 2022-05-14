import 'package:flutter/material.dart';

import '../models/api/novel_api.dart';
import '../models/novel_model.dart';
import '../../models/storage/local_storage.dart';

class HomeViewModel with ChangeNotifier {
  String idToken =
      'eyJhbGciOiJSUzI1NiIsImtpZCI6ImVmMzAxNjFhOWMyZGI3ODA5ZjQ1MTNiYjRlZDA4NzNmNDczMmY3MjEiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vbm92ZWxrdS05ZjFjNiIsImF1ZCI6Im5vdmVsa3UtOWYxYzYiLCJhdXRoX3RpbWUiOjE2NTE5NDE3MTgsInVzZXJfaWQiOiJJTXBlUEdMcDVwWGtTQ1lhSk9xSDZYQXM2bjQzIiwic3ViIjoiSU1wZVBHTHA1cFhrU0NZYUpPcUg2WEFzNm40MyIsImlhdCI6MTY1MTk0MTcxOCwiZXhwIjoxNjUxOTQ1MzE4LCJlbWFpbCI6ImJhaHJ1bEBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsImZpcmViYXNlIjp7ImlkZW50aXRpZXMiOnsiZW1haWwiOlsiYmFocnVsQGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6InBhc3N3b3JkIn19.loSZ-HRz4LCdv-E3Kd3cVm4h0TcIadi0iEIedn36VIYWvZ8AFbRc22mJXc2NAql581NYoXVnV_pfxxzd9fMIGurlMHd4QQvSwl6wjtTTQTB77JiKu30bIXuqh6cMfSnK_halhb54AZ09c8HsC-IgkWyiwiurampZX6K05ZaeROvUsoYikAZ4iSl-Rawo20iARL1OkEPPxsrZsN7-hHi__a3JxwLh8-ozrAABEyovCZFzdzCKvoS0WitS3ywZCSLB1vdFXbimZdcQ4tp7e-4vxykWFItUKU7QYxUk78XUW0lD_mgD-e7Sy115GCXU46Qxw0QAmkSGDTgXWWPMYOtiaA';

  final List<NovelModel> _novels = [];
  final List<NovelModel> _libraryNovels = [];
  List<NovelModel> _exploreNovels = [];

  List<NovelModel> get novels => _novels;
  List<NovelModel> get libraryNovels => _libraryNovels;
  List<NovelModel> get exploreNovels => _exploreNovels;

  bool isSearch = false;
  bool sortFromA = true;
  bool sortChapterFromA = true;

  HomeViewModel() {
    init();
  }

  init() async {
    await getAllData();
    updateExplore();
    updateLibrary();
    notifyListeners();
  }

  Future<void> getAllData() async {
    final novels = await NovelApi.getNovels();
    if (novels != null) {
      _novels.clear();
      print(novels.data);
      var dataResponse = novels.data as Map<String, dynamic>;
      print(dataResponse);
      dataResponse.forEach((key, value) async {
        List<ChapterModel> chapter = [];

        if (value['Chapter'] != null) {
          var isiChapter = value['Chapter'] as Map<String, dynamic>;

          isiChapter.forEach((key, value) {
            print(value['Content']);
            chapter.add(
              ChapterModel(
                id: key,
                judulChapter: value['JudulChapter'],
                content: value['Content'],
              ),
            );
          });
        }

        try {
          _novels.add(NovelModel(
              id: key,
              judul: value['Judul'],
              author: value['author'],
              status: value['status'],
              sinopsis: value['Sinopsis'],
              linkImage: value['LinkImage'],
              chapter: chapter));
        } catch (e) {
          print(e);
        }
      });

      _novels.sort(
          ((a, b) => a.judul.toLowerCase().compareTo(b.judul.toLowerCase())));
      print(_novels.indexWhere((element) => element.id == '-awdkawfawkcwa'));

      notifyListeners();
    } else {
      print('Gagal Memuat Data');
    }
  }

  updateExplore() async {
    try {
      _exploreNovels.clear();
      _exploreNovels = novels.toList();

      print(exploreNovels);
      notifyListeners();
    } catch (e) {
      print('Gagal mengupdate Explore');
    }
  }

  updateLibrary() async {
    List<String> idNovel = await LocalStorage.getLibrary();
    try {
      _libraryNovels.clear();
      if (idNovel != []) {
        for (var i = 0; i < idNovel.length; i++) {
          var indexNovels =
              _novels.indexWhere((element) => element.id == idNovel[i]);

          _libraryNovels.add(_novels[indexNovels]);
        }
      }

      print(idNovel);
      notifyListeners();
    } catch (e) {
      print('Gagal mengupdate library');
    }
  }

  void addToLibrary(String idNovel) async {
    var index = _novels.indexWhere((element) => element.id == idNovel);

    if (_libraryNovels.any((element) => element == _novels[index])) {
      print('Novel sudah ada');
    } else {
      _libraryNovels.add(novels[index]);
    }
    LocalStorage.setLibrary(libraryNovels);

    print(idNovel);

    print(_libraryNovels[0].linkImage);
  }

  deleteFromLibrary(String idNovel) {
    var index = _libraryNovels.indexWhere((element) => element.id == idNovel);
    _libraryNovels.removeAt(index);
    LocalStorage.setLibrary(libraryNovels);
    notifyListeners();
  }

  onChangeSearchState() {
    if (isSearch == false) {
      isSearch = true;
    } else {
      isSearch = false;
    }
    notifyListeners();
  }

  search(String search) {
    if (search.isNotEmpty) {
      _exploreNovels.clear();
      for (var element in novels) {
        if (element.judul.toLowerCase().contains(search.toLowerCase())) {
          _exploreNovels.add(element);
        }
      }
    } else {
      init();
    }
    notifyListeners();
  }

  sortNovel() {
    if (sortFromA == true) {
      _novels.sort(
          ((a, b) => b.judul.toLowerCase().compareTo(a.judul.toLowerCase())));
      _libraryNovels.sort(
          ((a, b) => b.judul.toLowerCase().compareTo(a.judul.toLowerCase())));
      _exploreNovels.sort(
          ((a, b) => b.judul.toLowerCase().compareTo(a.judul.toLowerCase())));
    } else {
      _novels.sort(
          ((a, b) => a.judul.toLowerCase().compareTo(b.judul.toLowerCase())));
      _libraryNovels.sort(
          ((a, b) => a.judul.toLowerCase().compareTo(b.judul.toLowerCase())));
      _exploreNovels.sort(
          ((a, b) => a.judul.toLowerCase().compareTo(b.judul.toLowerCase())));
    }
    notifyListeners();
  }

  sortChapter(i) {
    if (sortFromA == true) {
      _novels[i].chapter.sort(((a, b) => b.judulChapter
          .toLowerCase()
          .compareTo(a.judulChapter.toLowerCase())));
      _libraryNovels[i].chapter.sort(((a, b) => b.judulChapter
          .toLowerCase()
          .compareTo(a.judulChapter.toLowerCase())));
      _exploreNovels[i].chapter.sort(((a, b) => b.judulChapter
          .toLowerCase()
          .compareTo(a.judulChapter.toLowerCase())));
    } else {
      _novels[i].chapter.sort(((a, b) => a.judulChapter
          .toLowerCase()
          .compareTo(b.judulChapter.toLowerCase())));
      _libraryNovels[i].chapter.sort(((a, b) => a.judulChapter
          .toLowerCase()
          .compareTo(b.judulChapter.toLowerCase())));
      _exploreNovels[i].chapter.sort(((a, b) => a.judulChapter
          .toLowerCase()
          .compareTo(b.judulChapter.toLowerCase())));
    }
    notifyListeners();
  }
}
