import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  int _navIndex = 0;
  final int waitTime = 500;
  int get currentNavIndex => _navIndex;

  set currentNavIndex(int value) {
    _navIndex = value;
    notifyListeners();
  }

  final PageController controller = PageController();

  void nextPage() async {
    currentQuizProgress++;
    await controller.nextPage(
      duration: Duration(milliseconds: waitTime),
      curve: Curves.easeInOut,
    );

    currentAnswerIndex = -1;
    notifyListeners();
  }

  double currentQuizProgress = 0;

  int _currentAnswerIndex = -1;

  int get currentAnswerIndex => _currentAnswerIndex;
  set currentAnswerIndex(int value) {
    _currentAnswerIndex = value;
    notifyListeners();
  }

  String? _accessToken;
  bool hasLogged = false;
  String? get accessToken => _accessToken;

  set accessToken(String? value) {
    _accessToken = value;
    notifyListeners();
  }
}
