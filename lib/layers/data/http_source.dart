import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hac/layers/data/models/city.dart';
import 'package:hac/layers/data/models/deparment.dart';
import 'package:hac/layers/data/models/faculty.dart';
import 'package:hac/layers/data/models/groups.dart';
import 'package:hac/layers/data/models/id.dart';
import 'package:hac/layers/data/models/proffession.dart';
import 'package:hac/layers/data/models/token.dart';
import 'package:hac/layers/data/models/university.dart';
import 'package:http/http.dart' as http;

class Api {
  String host = "http://xn--80asdb2agmg.xn----7sbpbfclakh1al9a7fxc.xn--p1ai";

  Future<City> getAllCities() async{
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('$host/api/common/get_all_cities/');
    final response = await http.get(endPoint, headers: headers);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    return City.fromMap(jsonDecode(response.body));
  }

  Future<Proffession> getAllProffesions() async{
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('$host/api/common/get_all_professions/');
    final response = await http.get(endPoint, headers: headers);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    return Proffession.fromMap(jsonDecode(response.body));
  }


  Future<University> getAllUniversities() async{
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('$host/api/university/get_all_universities/');
    final response = await http.get(endPoint, headers: headers);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    return University.fromMap(jsonDecode(response.body));
  }

  Future<Faculty> getAllfaculties(int university_id) async{
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('$host/api/university/get_all_faculties/?university_id=$university_id');
    final response = await http.get(endPoint, headers: headers);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    return Faculty.fromMap(jsonDecode(response.body));
  }


  Future<Department> getAllDepartments(int faculty_id) async{
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('$host/api/university/get_all_departments/?faculty_id=$faculty_id');
    final response = await http.get(endPoint, headers: headers);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    return Department.fromMap(jsonDecode(response.body));
  }


  Future<Groups> getAllGroups(int department_id) async{
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('$host/api/university/get_all_groups/?department_id=$department_id');
    final response = await http.get(endPoint, headers: headers);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    return Groups.fromMap(jsonDecode(response.body));
  }


  Future<void> getAllStudent(int department_id) async{
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('$host/api/student/students/');
    final response = await http.get(endPoint, headers: headers);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
  }

  Future<void> getConcreteStudent(int student_id) async{
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('$host/api/student/students/$student_id/');
    final response = await http.get(endPoint, headers: headers);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
  }


   Future<StudentId> registerStudent(String fullname,String email,String password, String avatar,) async {
    final headers = {'Content-Type': 'application/json'};
    final body = {
      "fullname" : fullname,
      "email" : email,
      "password": password,
      "avatar": avatar,
    };
    var endPoint = Uri.parse('$host/api/student/students/');
    final response =
        await http.post(endPoint, headers: headers, body: json.encode(body));
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    return StudentId.fromMap(jsonDecode(response.body));
  }

  void patchStudent( int id, String token,int age,String sex,String about,int group) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': "Token $token"
    };
    final body = {
    'group' : group,
    "age": age,
    "sex": sex,
    "about": about
    };
    var endPoint = Uri.parse('$host/api/student/students/$id/');
    final response =
        await http.patch(endPoint, headers: headers, body: json.encode(body));
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
  }

  Future<Token> signIn(String username,String password,) async {
    final headers = {'Content-Type': 'application/json'};
    final body = {
     "username" : username, 
      "password": password,
    };
    var endPoint = Uri.parse('$host/token/');
    final response =
        await http.post(endPoint, headers: headers, body: json.encode(body));
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    return Token.fromMap(jsonDecode(response.body));
  }



}