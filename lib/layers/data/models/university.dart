import 'dart:convert';

import 'package:hac/layers/data/models/vus.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class University {
  List<dynamic> universities;
  University({
    required this.universities,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'universities': universities,
    };
  }

  factory University.fromMap(Map<String, dynamic> map) {
    return University(
      universities: map['universities'] as List<dynamic>,
    );
  }

  String toJson() => json.encode(toMap());

  factory University.fromJson(String source) => University.fromMap(json.decode(source) as Map<String, dynamic>);
}
