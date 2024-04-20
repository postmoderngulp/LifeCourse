import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Proffession {
  List<dynamic> professions;
  Proffession({
    required this.professions,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'professions': professions,
    };
  }

  factory Proffession.fromMap(Map<String, dynamic> map) {
    return Proffession(
      professions:map['professions'] as List<dynamic>,
    );
  }

  String toJson() => json.encode(toMap());

  factory Proffession.fromJson(String source) => Proffession.fromMap(json.decode(source) as Map<String, dynamic>);
}
