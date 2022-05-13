import 'dart:convert';

import 'package:novelku/models/novel_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static setfontSize(double fontSize) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('fontSize')) {
      await prefs.remove('fontSize');
    }
    await prefs.setDouble('fontSize', fontSize);
  }

  static Future<double> getFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    var fontSize = prefs.getDouble('fontSize');

    if (fontSize != null) {
      return fontSize;
    } else {
      return 20;
    }
  }

  static setLibrary(List<NovelModel> library) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> data = [];

    for (var element in library) {
      data.add(element.id);
    }

    if (prefs.containsKey('library')) {
      await prefs.remove('library');
    }
    await prefs.setStringList('library', data);
  }

  static Future<List<String>> getLibrary() async {
    final prefs = await SharedPreferences.getInstance();
    var library = prefs.getStringList('library');

    if (library != null) {
      return library;
    } else {
      return [];
    }
  }

  static setUserData(email, password) async {
    final prefs = await SharedPreferences.getInstance();

    var data = {
      'email': email,
      'password': password,
    };

    var jsonUserData = jsonEncode(data);

    // for (var element in userData) {
    //   data.add(element.id);
    // }

    if (prefs.containsKey('userData')) {
      await prefs.remove('userData');
    }
    await prefs.setString('userData', jsonUserData);
    print(data);
  }

  static Future getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    var jsonUserdata = prefs.getString('userData');

    if (jsonUserdata != null) {
      var data = jsonDecode(jsonUserdata);
      print(data['email']);
      return data;
    } else {
      print(null);
      return null;
    }
  }

  static clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userData');
    var jsonUserdata = prefs.getString('userData');
    print(jsonUserdata);
  }
}
