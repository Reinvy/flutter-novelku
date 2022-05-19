import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:novelku/models/api/user_api.dart';
import 'package:novelku/models/user_model.dart';
import 'package:novelku/view_models/novel_view_model.dart';

import '../models/storage/local_storage.dart';

class AuthViewModel with ChangeNotifier {
  bool isAuth = false;
  bool haveAccount = true;
  String? myEmail;

  String? idKey;

  // List<UserModel> _user = [];
  // List<UserModel> get user => _user;

  UserModel _user = UserModel(
    key: 'key',
    uId: 'uId',
    nama: 'nama',
    email: 'email',
    profileImage: 'profileImage',
    coverImage: 'coverImage',
  );
  UserModel get user => _user;

  AuthViewModel() {
    _init();
  }

  void _init() async {
    var data = await LocalStorage.getUserData();
    if (data != null) {
      signIn(data['email'], data['password']);
    }
  }

  Future<void> getUserData(uID) async {
    List<UserModel> userData = [];
    final data = await UserAPI.getUser();
    if (data != null) {
      var response = data.data as Map<String, dynamic>;

      response.forEach((key, value) {
        try {
          userData.add(UserModel(
            key: key,
            uId: value['uId'],
            nama: value['nama'],
            email: value['email'],
            profileImage: value['profileImage'],
            coverImage: value['coverImage'],
          ));
        } catch (e) {
          // rethrow;
        }
      });
      var index = userData.indexWhere((element) => element.uId == uID);
      _user = userData[index];
    }
    print(_user.uId);
    notifyListeners();
  }

  void onChangeAuthView() {
    if (haveAccount == true) {
      haveAccount = false;
    } else {
      haveAccount = true;
    }
    notifyListeners();
  }

  void logOut() {
    myEmail = null;
    isAuth = false;
    notifyListeners();
  }

  Future<void> signUp(String nama, String email, String password) async {
    var dio = Dio();
    String url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyD36XXAk1IOK65G5S9lFn0G3eaczXC85YI';
    try {
      await dio
          .post(
        url,
        data: json.encode({
          "email": email,
          "password": password,
          "returnSecureToken": true,
        }),
      )
          .then((value) {
        UserAPI.postUser(
          value.data['localId'],
          nama,
          email,
          'https://picsum.photos/id/237/200/300',
          'https://picsum.photos/id/239/200/300',
        );
      });
    } catch (e) {
      // rethrow;
    }
    signIn(email, password);
    notifyListeners();
  }

  signIn(String email, String password) async {
    var dio = Dio();
    String url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyD36XXAk1IOK65G5S9lFn0G3eaczXC85YI';

    try {
      myEmail = email;
      var response = await dio.post(
        url,
        data: {
          "email": email,
          "password": password,
          "returnSecureToken": true,
        },
      );
      print('object');
      await getUserData(response.data['localId']);
      isAuth = true;
      LocalStorage.setUserData(email, password);
      notifyListeners();
      return response.data["idToken"];
    } catch (e) {
      (e);
    }
  }
}
