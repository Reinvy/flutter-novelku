import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../data/storage/local_storage.dart';

class AuthViewModel with ChangeNotifier {
  bool isAuth = false;
  bool haveAccount = true;
  String? myEmail;

  String? idKey;

  AuthViewModel() {
    _init();
  }

  void _init() async {
    var data = await LocalStorage.getUserData();
    if (data != null) {
      signIn(data['email'], data['password']);
    }
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
    LocalStorage.clearUserData();
    notifyListeners();
  }

  void signUp(String email, String password) async {
    var dio = Dio();
    String url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyD36XXAk1IOK65G5S9lFn0G3eaczXC85YI';
    try {
      var response = await dio.post(
        url,
        data: json.encode({
          "email": email,
          "password": password,
          "returnSecureToken": true,
        }),
      );

      print(response.data);
    } catch (e) {}
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

      // print(response);
      // HomeViewModel().updateToken(response.data["idToken"]);
      isAuth = true;
      LocalStorage.setUserData(email, password);
      notifyListeners();
      return response.data["idToken"];
    } catch (e) {
      (e);
    }
  }
}
