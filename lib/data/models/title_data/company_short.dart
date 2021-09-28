import 'dart:convert';

class CompanyShortModel {
  final String? id;
  final String? name;

  CompanyShortModel({
    this.id,
    this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory CompanyShortModel.fromMap(Map<String, dynamic> map) {
    return CompanyShortModel(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyShortModel.fromJson(String source) =>
      CompanyShortModel.fromMap(json.decode(source));
}
