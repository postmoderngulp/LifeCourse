import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Application {
  int id;
  String? result;
  bool accepted;
  int event;
  int student;
  Application({
    required this.id,
    required this.result,
    required this.accepted,
    required this.event,
    required this.student,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'result': result,
      'accepted': accepted,
      'event': event,
      'student': student,
    };
  }

  factory Application.fromMap(Map<String, dynamic> map) {
    return Application(
      id: map['id'] as int,
      result: map['result'] != null ? map['result'] as String : null,
      accepted: map['accepted'] as bool,
      event: map['event'] as int,
      student: map['student'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Application.fromJson(String source) => Application.fromMap(json.decode(source) as Map<String, dynamic>);
}
