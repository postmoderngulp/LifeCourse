import 'package:flutter/material.dart';

class EventInfoStudentNotifier extends ChangeNotifier {
  bool isLike = false;

  void setLike() {
    isLike = !isLike;
    notifyListeners();
  }
}