import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MyProfile {
  int id;
  String last_name;
  String first_name;
  String second_name;
  int age;
  List<dynamic> skills;
  String sex;
  String? about;
  String avatar;
  String? resume;
  int user;
  int group;
  int university;
  int faculty;
  int department;
  MyProfile({
    required this.id,
    required this.last_name,
    required this.first_name,
    required this.second_name,
    required this.age,
    required this.skills,
    required this.sex,
    this.about,
    required this.avatar,
    this.resume,
    required this.user,
    required this.group,
    required this.university,
    required this.faculty,
    required this.department,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'last_name': last_name,
      'first_name': first_name,
      'second_name': second_name,
      'age': age,
      'skills': skills,
      'sex': sex,
      'about': about,
      'avatar': avatar,
      'resume': resume,
      'user': user,
      'group': group,
      'university': university,
      'faculty': faculty,
      'department': department,
    };
  }

  factory MyProfile.fromMap(Map<String, dynamic> map) {
    return MyProfile(
      id: map['id'] as int,
      last_name: map['last_name'] as String,
      first_name: map['first_name'] as String,
      second_name: map['second_name'] as String,
      age: map['age'] as int,
      skills: map['skills'] as List<dynamic>,
      sex: map['sex'] as String,
      about: map['about'] != null ? map['about'] as String : null,
      avatar: map['avatar'] as String,
      resume: map['resume'] != null ? map['resume'] as String : null,
      user: map['user'] as int,
      group: map['group'] as int,
      university: map['university'] as int,
      faculty: map['faculty'] as int,
      department: map['department'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory MyProfile.fromJson(String source) => MyProfile.fromMap(json.decode(source) as Map<String, dynamic>);
}
