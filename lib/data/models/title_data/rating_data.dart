import 'dart:convert';

class RatingDataModel {
  final String? imDbId;
  final String? title;
  final String? fullTitle;
  final String? type;
  final String? year;
  final String? imDb;
  final String? metacritic;
  final String? theMovieDb;
  final String? rottenTomatoes;
  final String? tVcom;
  final String? filmAffinity;
  final String? errorMessage;

  RatingDataModel({
    this.imDbId,
    this.title,
    this.fullTitle,
    this.type,
    this.year,
    this.imDb,
    this.metacritic,
    this.theMovieDb,
    this.rottenTomatoes,
    this.tVcom,
    this.filmAffinity,
    this.errorMessage,
  });

  Map<String, dynamic> toMap() {
    return {
      'imDbId': imDbId,
      'title': title,
      'fullTitle': fullTitle,
      'type': type,
      'year': year,
      'imDb': imDb,
      'metacritic': metacritic,
      'theMovieDb': theMovieDb,
      'rottenTomatoes': rottenTomatoes,
      'tVcom': tVcom,
      'filmAffinity': filmAffinity,
      'errorMessage': errorMessage,
    };
  }

  factory RatingDataModel.fromMap(Map<String, dynamic> map) {
    return RatingDataModel(
      imDbId: map['imDbId'],
      title: map['title'],
      fullTitle: map['fullTitle'],
      type: map['type'],
      year: map['year'],
      imDb: map['imDb'],
      metacritic: map['metacritic'],
      theMovieDb: map['theMovieDb'],
      rottenTomatoes: map['rottenTomatoes'],
      tVcom: map['tVcom'],
      filmAffinity: map['filmAffinity'],
      errorMessage: map['errorMessage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RatingDataModel.fromJson(String source) =>
      RatingDataModel.fromMap(json.decode(source));
}
