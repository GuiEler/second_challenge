import 'dart:convert';

class CastShortItemModel {
  final String? id;
  final String? name;
  final String? description;

  CastShortItemModel({
    this.id,
    this.name,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory CastShortItemModel.fromMap(Map<String, dynamic> map) {
    return CastShortItemModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CastShortItemModel.fromJson(String source) =>
      CastShortItemModel.fromMap(json.decode(source));
}
