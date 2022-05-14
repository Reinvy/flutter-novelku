import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

import '../models/storage/cloud_storage.dart';
import '../models/api/novel_api.dart';

class PublishViewModel with ChangeNotifier {
  File? image;
  FirebaseStorage storage = FirebaseStorage.instance;

  Future openGallery() async {
    try {
      final imageGallery =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imageGallery != null) {
        image = File(imageGallery.path);
      }
    } catch (e) {}
    notifyListeners();
  }

  Future postNovel(
    judul,
    sinopsis,
    author,
  ) async {
    if (image == null) {
      try {
        NovelApi.postNovel(judul, sinopsis, author, 'Berlanjut',
            'https://picsum.photos/id/122/200/300');
      } catch (e) {
        rethrow;
      }
    } else {
      final fileName = basename(image!.path);
      final destination = 'cover/$fileName';
      try {
        var linkImage = await CloudStorage.uploadImage(destination, image!);

        NovelApi.postNovel(judul, sinopsis, author, 'Berlanjut', linkImage);
        image = null;
        print(linkImage);
      } catch (e) {
        print(e);
      }
    }
  }

  Future deleteNovel(String idNovel) async {
    try {
      await NovelApi.deleteNovel(idNovel);
      print('Delete Novel');
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future postChapter(
    idNovel,
    judulChapter,
    content,
  ) async {
    try {
      NovelApi.postChapters(idNovel, judulChapter, content);
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future deleteChapter(String idNovel, idChapter) async {
    try {
      NovelApi.deleteChapter(idNovel, idChapter);
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
