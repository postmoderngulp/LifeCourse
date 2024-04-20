import 'dart:convert';

class Groups {
  List<dynamic> groups;
  Groups({
    required this.groups,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'groups': groups,
    };
  }

  factory Groups.fromMap(Map<String, dynamic> map) {
    return Groups(
      groups:map['groups'] as List<dynamic>,
    );
  }

  String toJson() => json.encode(toMap());

  factory Groups.fromJson(String source) => Groups.fromMap(json.decode(source) as Map<String, dynamic>);
}