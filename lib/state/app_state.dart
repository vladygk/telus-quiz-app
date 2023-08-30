import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  int _navIndex = 0;

  int get currentNavIndex => _navIndex;

  set currentNavIndex(int value) {
    _navIndex = value;
    notifyListeners();
  }
}