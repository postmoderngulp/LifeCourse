import 'package:flutter/material.dart';
import 'package:hac/layers/presentation/pages/auth/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileNotifier extends ChangeNotifier {
  void logOut(BuildContext context) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setBool('session', false);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignIn()));
  }
}