import 'dart:convert';

class SimilarShortModel {
  final String? id;
  final String? title;
  final String? image;

  SimilarShortModel({
    this.id,
    this.title,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
    };
  }

  factory SimilarShortModel.fromMap(Map<String, dynamic> map) {
    return SimilarShortModel(
      id: map['id'],
      title: map['title'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SimilarShortModel.fromJson(String source) =>
      SimilarShortModel.fromMap(json.decode(source));
}
