import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hac/layers/presentation/pages/auth/choose_main.dart';
import 'package:hac/layers/presentation/pages/student/main_student.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var isSession =  sharedPreferences.getBool('session');
    if(isSession == null){
      sharedPreferences.setBool('session', false);
      isSession = false;
    }
  runApp(ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Life Course',
        theme: ThemeData(
        ),
        home:  isSession ? MainStudent() : const ChooseMain(),
      ),
    ));
}



