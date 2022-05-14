import 'package:flutter/material.dart';

import '../models/storage/local_storage.dart';

class ChapterViewModel with ChangeNotifier {
  double _fontSize = 20;
  bool _darkTheme = false;

  double get fontSize => _fontSize;
  bool get darkTheme => _darkTheme;

  ChapterViewModel() {
    _init();
  }

  _init() async {
    double prefs = await LocalStorage.getFontSize();
    _fontSize = prefs;
    notifyListeners();
  }

  increment() {
    _fontSize += 1;
    LocalStorage.setfontSize(fontSize);
    notifyListeners();
  }

  decrement() {
    _fontSize -= 1;
    LocalStorage.setfontSize(fontSize);
    notifyListeners();
  }

  changeTheme() {
    if (_darkTheme == false) {
      _darkTheme = true;
    } else if (_darkTheme == true) {
      _darkTheme = false;
    }
    notifyListeners();
  }
}
