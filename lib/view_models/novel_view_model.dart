import 'package:flutter/material.dart';

import '../../models/storage/local_storage.dart';
import '../models/api/novel_api.dart';
import '../models/novel_model.dart';

class NovelViewModel with ChangeNotifier {
  final List<NovelModel> _novels = [];
  final List<NovelModel> _libraryNovels = [];
  List<NovelModel> _exploreNovels = [];

  List<NovelModel> get novels => _novels;
  List<NovelModel> get libraryNovels => _libraryNovels;
  List<NovelModel> get exploreNovels => _exploreNovels;

  bool isSearch = false;
  bool sortFromA = true;
  bool sortChapterFromA = true;

  NovelViewModel() {
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

      var dataResponse = novels.data as Map<String, dynamic>;

      dataResponse.forEach((key, value) async {
        List<ChapterModel> chapter = [];

        if (value['Chapter'] != null) {
          var isiChapter = value['Chapter'] as Map<String, dynamic>;

          isiChapter.forEach((key, value) {
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
          // rethrow;
        }
      });

      _novels.sort(
          ((a, b) => a.judul.toLowerCase().compareTo(b.judul.toLowerCase())));
    }
    notifyListeners();
  }

  updateExplore() async {
    try {
      _exploreNovels.clear();
      _exploreNovels = novels.toList();

      notifyListeners();
    } catch (e) {
      // rethrow;
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

      notifyListeners();
    } catch (e) {
      // rethrow;
    }
  }

  void addToLibrary(String idNovel) async {
    var index = _novels.indexWhere((element) => element.id == idNovel);

    if (_libraryNovels.any((element) => element == _novels[index])) {
    } else {
      _libraryNovels.add(novels[index]);
    }
    LocalStorage.setLibrary(libraryNovels);
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
    if (sortChapterFromA == true) {
      _novels[i].chapter.sort(((a, b) => b.judulChapter
          .toLowerCase()
          .compareTo(a.judulChapter.toLowerCase())));

      sortChapterFromA = false;
    } else {
      _novels[i].chapter.sort(((a, b) => a.judulChapter
          .toLowerCase()
          .compareTo(b.judulChapter.toLowerCase())));

      sortChapterFromA = true;
    }
    notifyListeners();
  }
}
