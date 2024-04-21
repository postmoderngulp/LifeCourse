import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hac/layers/data/http_source.dart';

class StudentFacultyNotifier extends ChangeNotifier {
  String faculty = '';
  String description = '';

   StudentFacultyNotifier() {
    _setup();
  }


  void _setup() async{
    Api api = Api();
    const storage = FlutterSecureStorage();
    final token =  await storage.read(key: "token");
    final profile = await api.getMyProfile(token!);
    final facultyy = await api.getConcreteFac(profile.faculty);
    faculty = facultyy.name;
    description = facultyy.description;
    notifyListeners();
  }


}