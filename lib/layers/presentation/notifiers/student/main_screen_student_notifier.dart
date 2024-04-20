import 'package:flutter/material.dart';

class MainScreenStudentNotifier extends ChangeNotifier {
  bool isLike = false;


  void setLike() {
    isLike = !isLike;
    notifyListeners();
  }
}