import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hac/layers/data/models/application.dart';
import 'package:hac/layers/data/models/caf.dart';
import 'package:hac/layers/data/models/categories.dart';
import 'package:hac/layers/data/models/city.dart';
import 'package:hac/layers/data/models/deparment.dart';
import 'package:hac/layers/data/models/event.dart';
import 'package:hac/layers/data/models/event_req.dart';
import 'package:hac/layers/data/models/events.dart';
import 'package:hac/layers/data/models/eventss.dart';
import 'package:hac/layers/data/models/fac.dart';
import 'package:hac/layers/data/models/faculty.dart';
import 'package:hac/layers/data/models/group.dart';
import 'package:hac/layers/data/models/groups.dart';
import 'package:hac/layers/data/models/id.dart';
import 'package:hac/layers/data/models/proffession.dart';
import 'package:hac/layers/data/models/profile_student.dart';
import 'package:hac/layers/data/models/skill.dart';
import 'package:hac/layers/data/models/student.dart';
import 'package:hac/layers/data/models/studentRating.dart';
import 'package:hac/layers/data/models/token.dart';
import 'package:hac/layers/data/models/unik.dart';
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

  Future<MyProfile> getMyProfile(String token) async{
    final headers = {'Content-Type': 'application/json','Authorization': "Token $token"};
    var endPoint = Uri.parse('$host/api/student/get_my_profile/');
    final response = await http.get(endPoint, headers: headers);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
     return MyProfile.fromMap(jsonDecode(response.body));
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


  Future<List<Skill>> getAllSkills() async{
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('$host/api/student/skills/');
    final response = await http.get(endPoint, headers: headers);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    List<Skill> skills = [];
    final list = jsonDecode(response.body);
    for(int i = 0; i < list.length;i++){
      skills.add(Skill.fromMap(list[i]));
    }
    return skills;
  }


  Future<StudentRating> getRating() async{
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('$host/api/rating/ratings/?group_by=students');
    final response = await http.get(endPoint, headers: headers);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    return StudentRating.fromMap(jsonDecode(response.body));
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


  Future<List<Student>> getAllStudent(String fullname,int age_gte,int age_lte,int university_id,int faculty_id,int department_id,int group_id) async{
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('$host/api/student/students/?fullname=$fullname&age_gte=$age_gte&age_lte=$age_lte&university=$university_id&faculty=$faculty_id&department=$department_id&group=$group_id');
    final response = await http.get(endPoint, headers: headers);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    List<Student> students = [];
    final list = jsonDecode(response.body);
    for(int i = 0;i < list.length;i++){
      students.add(Student.fromMap(list[i]));
    }
    return students;
  }

  Future<List<Student>> getAllStudentWithOUtFilter() async{
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('$host/api/student/students');
    final response = await http.get(endPoint, headers: headers);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    List<Student> students = [];
    final list = jsonDecode(response.body);
    for(int i = 0;i < list.length;i++){
      students.add(Student.fromMap(list[i]));
    }
    return students;
  }


  Future<List<Student>> getAllStudentByGroup(int group_id,) async{
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('$host/api/student/students/?group=$group_id');
    final response = await http.get(endPoint, headers: headers);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    List<Student> students = [];
    final list = jsonDecode(response.body);
    for(int i = 0;i < list.length;i++){
      students.add(Student.fromMap(list[i]));
    }
    return students;
  }


  Future<List<Student>> getAllStudentByGroupAge(int group_id,int age_gte, int age_lte) async{
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('$host/api/student/students/?group=$group_id&age_gte=$age_gte&age_lte=$age_lte');
    final response = await http.get(endPoint, headers: headers);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    List<Student> students = [];
    final list = jsonDecode(response.body);
    for(int i = 0;i < list.length;i++){
      students.add(Student.fromMap(list[i]));
    }
    return students;
  }


  Future<MyEvent> getAllEvent() async{
    final headers = {'Content-Type': 'application/json',};
    var endPoint = Uri.parse('$host/api/event/get_all_events');
    final response = await http.get(endPoint, headers: headers);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    return MyEvent.fromMap(jsonDecode(response.body));
  }


  Future<MyEvent> getMyEvent(String token) async{
    final headers = {'Content-Type': 'application/json','Authorization': "Token $token"};
    var endPoint = Uri.parse('$host/api/event/get_all_events');
    final response = await http.get(endPoint, headers: headers);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    return MyEvent.fromMap(jsonDecode(response.body));
  }

   Future<List<event>> getAllEventFilter(String date,int category,) async{
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('$host/api/event/get_all_events/?name&date=$date&category=$category');
    final response = await http.get(endPoint, headers: headers);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    List<event> events = [];
    final list = jsonDecode(response.body);
    final val =  Eveents.fromMap(list);
    for(int i = 0;i < val.events.length;i++){
      events.add(event.fromMap(val.events[i]));
    }
    return events;
  }

  




  Future<Student> getConcreteStudent(int student_id) async{
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('$host/api/student/students/$student_id/');
    final response = await http.get(endPoint, headers: headers);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    return Student.fromMap(jsonDecode(response.body));
  }


  Future<Skill> getConcreteSkill(int skill_id) async{
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('$host/api/student/skills/$skill_id/');
    final response = await http.get(endPoint, headers: headers);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    return Skill.fromMap(jsonDecode(response.body));
  }

  Future<Event_req> getConcreteEvent(int event_id) async{
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('$host/api/event/get_event/?event_id=$event_id');
    final response = await http.get(endPoint, headers: headers);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    return Event_req.fromMap(jsonDecode(response.body));
  }

   Future<Unik> getConcreteUniversity(int university_id) async{
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('$host/api/university/get_university/?university_id=$university_id');
    final response = await http.get(endPoint, headers: headers);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    return Unik.fromMap(jsonDecode(response.body));
  }


  Future<Fac> getConcreteFac(int fac_id) async{
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('$host/api/university/get_faculty/?faculty_id=$fac_id');
    final response = await http.get(endPoint, headers: headers);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    return Fac.fromMap(jsonDecode(response.body));
  }

  Future<Caf> getConcreteCaf(int caf_id) async{
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('$host/api/university/get_department/?department_id=$caf_id');
    final response = await http.get(endPoint, headers: headers);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    return Caf.fromMap(jsonDecode(response.body));
  }

  Future<Group> getConcreteGroup(int group_id) async{
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('$host/api/university/get_group/?group_id=$group_id');
    final response = await http.get(endPoint, headers: headers);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    return Group.fromMap(jsonDecode(response.body));
  }

  

  Future<List<Application>> getAllApplicationAccepted() async{
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('$host/api/event/eventrequests/?accepted=true');
    final response = await http.get(endPoint, headers: headers);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    List<Application> applications = [];
    final list = jsonDecode(response.body);
    for(int i = 0; i < list.length;i++){
      applications.add(Application.fromMap(list[i]));
    }
    return applications;
  }

  Future<List<Application>> getAllApplicationNonAccepted() async{
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('$host/api/event/eventrequests/?accepted=false');
    final response = await http.get(endPoint, headers: headers);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    List<Application> applications = [];
    final list = jsonDecode(response.body);
    for(int i = 0; i < list.length;i++){
      applications.add(Application.fromMap(list[i]));
    }
    return applications;
  }



  Future<Categories> getALlCategories() async{
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('$host/api/common/get_all_categories/');
    final response = await http.get(endPoint, headers: headers);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    final list = jsonDecode(response.body);
    return Categories.fromMap(list);
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

  
   Future<void> sendApplication(int event_id,String token) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': "Token $token"};
    final body = {
      "event" : event_id
    };
    var endPoint = Uri.parse('$host/api/event/eventrequests/');
    final response =
        await http.post(endPoint, headers: headers, body: json.encode(body));
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
  }

  void patchStudent( int id, String token,int age,String sex,String about,int group,int skill) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': "Token $token"
    };
    final body = {
      'skills' : [skill],
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


    void redactStudent( int id, String token,int age,String sex,String about,int group,String full_name,String avatar,String resume,int university,int faculty,int department,int skill) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': "Token $token"
    };
    final body = {
      'full_name' : full_name,
      'avatar' : 'path/to/avatar',
      'resume' : resume,
      'skills' :  [skill],
      'university' : university,
      'faculty' : faculty,
      'department' : department,
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