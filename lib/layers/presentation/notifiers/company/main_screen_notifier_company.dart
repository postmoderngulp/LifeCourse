import 'package:flutter/cupertino.dart';

class MainScreenNotifierCompany extends ChangeNotifier {
  bool isLike = false;
  
  void setLike() {
    isLike = !isLike;
    notifyListeners();
  }
}