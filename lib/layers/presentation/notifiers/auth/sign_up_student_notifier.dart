
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hac/layers/data/http_source.dart';
import 'package:hac/layers/data/models/id.dart';
import 'package:hac/layers/presentation/pages/auth/sign_up_student2.dart';
import 'package:image_picker/image_picker.dart';

class SignUpStudentNotifier extends ChangeNotifier {
  String fio = "";
  String email = "";
  String password = "";
  bool isObscure = true;
  bool passwordValide = false;

  XFile? file;
  Uint8List? bytes;


  void setObscure(){
    isObscure = !isObscure;
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

  void setPasswordValidate(String password){
    passwordValide = password.length < 6  ? false : true;
    notifyListeners();
  }


  void registerStudent(String fullname, String email, String password,String path,BuildContext context) async{
    try{
      Api api = Api();
      StudentId id =   await api.registerStudent(fullname, email, password, '/path/to/avatar/');
     final token =  await api.signIn(email, password);
     const storage = FlutterSecureStorage();
      await storage.write(key: "token", value: token.token);
    Navigator.of(context ).push(MaterialPageRoute(builder: (context) =>  SignUpStudent2(id: id.id,)));
    }
    catch(e){
      print('ошибка');
    }
    
  }
}