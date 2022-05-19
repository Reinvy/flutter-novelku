import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:novelku/models/api/user_api.dart';
import 'package:path/path.dart';

import '../models/storage/cloud_storage.dart';
import '../models/api/novel_api.dart';

class PublishViewModel with ChangeNotifier {
  File? image;
  // Comment FirebaseStorage.instance for widget testing
  FirebaseStorage storage = FirebaseStorage.instance;

  Future openGallery() async {
    try {
      final imageGallery =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imageGallery != null) {
        image = File(imageGallery.path);
      }
    } catch (e) {
      // rethrow;
    }
    notifyListeners();
  }

  Future uploadProfile(
    key,
    uId,
    nama,
    email,
    coverImage,
  ) async {
    await openGallery();
    if (image != null) {
      final fileName = basename(image!.path);
      final destination = 'cover/$fileName';
      try {
        var profileImage = await CloudStorage.uploadImage(destination, image!);

        UserAPI.updateProfile(
          key,
          uId,
          nama,
          email,
          profileImage,
          coverImage,
        );
        image = null;
      } catch (e) {
        // rethrow;
      }
    }
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
        // rethrow;
      }
    } else {
      final fileName = basename(image!.path);
      final destination = 'cover/$fileName';
      try {
        var linkImage = await CloudStorage.uploadImage(destination, image!);

        NovelApi.postNovel(judul, sinopsis, author, 'Berlanjut', linkImage);
        image = null;
      } catch (e) {
        // rethrow;
      }
    }
  }

  Future deleteNovel(String idNovel) async {
    try {
      await NovelApi.deleteNovel(idNovel);
    } catch (e) {
      // rethrow;
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
      // rethrow;
    }
    notifyListeners();
  }

  Future deleteChapter(String idNovel, idChapter) async {
    try {
      NovelApi.deleteChapter(idNovel, idChapter);
    } catch (e) {
      // rethrow;
    }
    notifyListeners();
  }
}
