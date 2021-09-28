import 'dart:convert';

class MovieShortModel {
  final String? id;
  final String? title;
  final String? year;
  final String? image;
  final String? imDbRating;

  MovieShortModel({
    this.id,
    this.title,
    this.year,
    this.image,
    this.imDbRating,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'year': year,
      'image': image,
      'imDbRating': imDbRating,
    };
  }

  factory MovieShortModel.fromMap(Map<String, dynamic> map) {
    return MovieShortModel(
      id: map['id'],
      title: map['title'],
      year: map['year'],
      image: map['image'],
      imDbRating: map['imDbRating'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieShortModel.fromJson(String source) =>
      MovieShortModel.fromMap(json.decode(source));
}
