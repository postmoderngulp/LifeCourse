import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hac/layers/data/http_source.dart';
import 'package:hac/layers/presentation/pages/student/main_student.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInNotifier extends ChangeNotifier {
  String nickname = '';
  String password = '';
  bool nicknameValidate = false;
  bool passwordValidate = false;

  void setNicknameValidate(String nick){
    nicknameValidate = nick.length < 4 ? false : true;
    notifyListeners();
  }


  void setPasswordValidate(String pass){
    passwordValidate = password.length < 6 ? false : true;
    notifyListeners();
  }


  void signIn(String email, String password,BuildContext context)  async {
    try{
      Api api = Api();
    final token = await api.signIn(email, password);
    const storage = FlutterSecureStorage();
      await storage.write(key: "token", value: token.token);
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setBool('session', true);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainStudent()));
    }catch(e) {
      print(e.toString());
    }
    
  }

}