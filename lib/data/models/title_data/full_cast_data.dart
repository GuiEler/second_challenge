import 'dart:convert';

import '../models.dart';

class FullCastDataModel {
  final String? imDbId;
  final String? title;
  final String? fullTitle;
  final String? type;
  final String? year;
  final CastShortModel? directors;
  final CastShortModel? writers;
  final List<ActorShortModel>? actors;
  final List<CastShortModel>? others;
  final String? errorMessage;

  FullCastDataModel({
    this.imDbId,
    this.title,
    this.fullTitle,
    this.type,
    this.year,
    this.directors,
    this.writers,
    this.actors,
    this.others,
    this.errorMessage,
  });

  Map<String, dynamic> toMap() {
    return {
      'imDbId': imDbId,
      'title': title,
      'fullTitle': fullTitle,
      'type': type,
      'year': year,
      'directors': directors?.toMap(),
      'writers': writers?.toMap(),
      'actors': actors?.map((x) => x.toMap()).toList(),
      'others': others?.map((x) => x.toMap()).toList(),
      'errorMessage': errorMessage,
    };
  }

  factory FullCastDataModel.fromMap(Map<String, dynamic> map) {
    return FullCastDataModel(
      imDbId: map['imDbId'],
      title: map['title'],
      fullTitle: map['fullTitle'],
      type: map['type'],
      year: map['year'],
      directors: CastShortModel.fromMap(map['directors']),
      writers: CastShortModel.fromMap(map['writers']),
      actors: List<ActorShortModel>.from(
          map['actors']?.map((x) => ActorShortModel.fromMap(x))),
      others: List<CastShortModel>.from(
          map['others']?.map((x) => CastShortModel.fromMap(x))),
      errorMessage: map['errorMessage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FullCastDataModel.fromJson(String source) =>
      FullCastDataModel.fromMap(json.decode(source));
}
