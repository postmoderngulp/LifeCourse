import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateEventStudentNotifier extends ChangeNotifier {
  String description = '';
  String chapter = '';
  List<String> chapterList = [];
   XFile? file;
  Uint8List? bytes;


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