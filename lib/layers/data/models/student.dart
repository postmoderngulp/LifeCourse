import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Student {
  int id;
  String last_name;
  String first_name;  
  String second_name;
  int age;
  String sex;
  String? about;
  String? avatar;
  String? resume;
  int? group;
  int? university;
  int? faculty;
  int? department;
  Student({
    required this.id,
    required this.last_name,
    required this.first_name,
    required this.second_name,
    required this.age,
    required this.sex,
    required this.about,
    required this.avatar,
    this.resume,
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
      'sex': sex,
      'about': about,
      'avatar': avatar,
      'resume': resume,
      'group': group,
      'university': university,
      'faculty': faculty,
      'department': department,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] as int,
      last_name: map['last_name'] as String,
      first_name: map['first_name'] as String,
      second_name: map['second_name'] as String,
      age: map['age'] as int,
      sex: map['sex'] as String,
      about: map['about'] != null ? map['about'] as String :null,
      avatar: map['avatar'] != null ? map['avatar'] as String :null,
      resume: map['resume'] != null ? map['resume'] as String : null,
      group: map['group'] != null ? map['group'] as int : null,
      university: map['university'] != null ? map['university'] as int : null,
      faculty: map['faculty'] != null ? map['faculty'] as int : null,
      department: map['department'] != null ? map['department'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) => Student.fromMap(json.decode(source) as Map<String, dynamic>);
}
