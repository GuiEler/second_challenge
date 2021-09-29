import 'dart:convert';

class StarShortModel {
  final String? id;
  final String? name;

  StarShortModel({
    this.id,
    this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory StarShortModel.fromMap(Map<String, dynamic> map) {
    return StarShortModel(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StarShortModel.fromJson(String source) =>
      StarShortModel.fromMap(json.decode(source));
}
