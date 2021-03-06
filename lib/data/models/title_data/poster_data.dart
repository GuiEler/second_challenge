import 'dart:convert';

import '../models.dart';

class PosterDataModel {
  final String? imDbId;
  final String? title;
  final String? fullTitle;
  final String? type;
  final String? year;
  final List<PosterDataItemModel>? posters;
  final List<PosterDataItemModel>? backdrops;
  final String? errorMessage;

  PosterDataModel({
    this.imDbId,
    this.title,
    this.fullTitle,
    this.type,
    this.year,
    this.posters,
    this.backdrops,
    this.errorMessage,
  });

  Map<String, dynamic> toMap() {
    return {
      'imDbId': imDbId,
      'title': title,
      'fullTitle': fullTitle,
      'type': type,
      'year': year,
      'posters': posters?.map((x) => x.toMap()).toList(),
      'backdrops': backdrops?.map((x) => x.toMap()).toList(),
      'errorMessage': errorMessage,
    };
  }

  factory PosterDataModel.fromMap(Map<String, dynamic> map) {
    return PosterDataModel(
      imDbId: map['imDbId'],
      title: map['title'],
      fullTitle: map['fullTitle'],
      type: map['type'],
      year: map['year'],
      posters: List<PosterDataItemModel>.from(
          map['posters']?.map((x) => PosterDataItemModel.fromMap(x))),
      backdrops: List<PosterDataItemModel>.from(
          map['backdrops']?.map((x) => PosterDataItemModel.fromMap(x))),
      errorMessage: map['errorMessage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PosterDataModel.fromJson(String source) =>
      PosterDataModel.fromMap(json.decode(source));
}
