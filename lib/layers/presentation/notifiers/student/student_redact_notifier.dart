import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class StudentRedactNotifier extends ChangeNotifier {
  String nickname = '';
  String age = '';
  String sex = '';
  String vus = '';
  String fac = '';
  String caf = '';
  String group = '';
  String aboutme = '';
  bool sexValide = false;
  List<String> sexList = ["Мужской", "Женский"];
  List<String> vusList = ["ОГУ",];
  List<String> facList = [];
  List<String> cafList = [];
  List<String> groupList = [];
   bool nicknameValidate = false;
    XFile? file;
  Uint8List? bytes;

   void setNicknameValidate(String nick){
    nicknameValidate = nick.length < 4 ? false : true;
    notifyListeners();
  }

    void setSexValidate(String sex){
    sexValide = sex.isEmpty  ? false : true;
    notifyListeners();
  }


  void chooseImage() async {
      ImagePicker picker = ImagePicker();
       file = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if(file == null) return;
     bytes =  await file!.readAsBytes();
     notifyListeners();
  }
}