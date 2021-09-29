import 'dart:convert';
import '../../../domain/entities/entities.dart';
import '../models.dart';

class NewMovieDataDetailModel {
  final String? id;
  final String? title;
  final String? fullTitle;
  final String? year;
  final String? releaseState;
  final String? image;
  final String? runtimeMins;
  final String? runtimeStr;
  final String? plot;
  final String? contentRating;
  final String? imDbRating;
  final String? imDbRatingCount;
  final String? metacriticRating;
  final String? genres;
  final List<KeyValueItemModel>? genreList;
  final String? directors;
  final List<StarShortModel>? directorList;
  final String? stars;
  final List<StarShortModel>? starList;

  NewMovieDataDetailModel({
    this.id,
    this.title,
    this.fullTitle,
    this.year,
    this.releaseState,
    this.image,
    this.runtimeMins,
    this.runtimeStr,
    this.plot,
    this.contentRating,
    this.imDbRating,
    this.imDbRatingCount,
    this.metacriticRating,
    this.genres,
    this.genreList,
    this.directors,
    this.directorList,
    this.stars,
    this.starList,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'fullTitle': fullTitle,
      'year': year,
      'releaseState': releaseState,
      'image': image,
      'runtimeMins': runtimeMins,
      'runtimeStr': runtimeStr,
      'plot': plot,
      'contentRating': contentRating,
      'imDbRating': imDbRating,
      'imDbRatingCount': imDbRatingCount,
      'metacriticRating': metacriticRating,
      'genres': genres,
      'genreList': genreList?.map((x) => x.toMap()).toList(),
      'directors': directors,
      'directorList': directorList?.map((x) => x.toMap()).toList(),
      'stars': stars,
      'starList': starList?.map((x) => x.toMap()).toList(),
    };
  }

  factory NewMovieDataDetailModel.fromMap(Map<String, dynamic> map) {
    return NewMovieDataDetailModel(
      id: map['id'],
      title: map['title'],
      fullTitle: map['fullTitle'],
      year: map['year'],
      releaseState: map['releaseState'],
      image: map['image'],
      runtimeMins: map['runtimeMins'],
      runtimeStr: map['runtimeStr'],
      plot: map['plot'],
      contentRating: map['contentRating'],
      imDbRating: map['imDbRating'],
      imDbRatingCount: map['imDbRatingCount'],
      metacriticRating: map['metacriticRating'],
      genres: map['genres'],
      genreList: List<KeyValueItemModel>.from(
          map['genreList']?.map((x) => KeyValueItemModel.fromMap(x))),
      directors: map['directors'],
      directorList: List<StarShortModel>.from(
          map['directorList']?.map((x) => StarShortModel.fromMap(x))),
      stars: map['stars'],
      starList: List<StarShortModel>.from(
          map['starList']?.map((x) => StarShortModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory NewMovieDataDetailModel.fromJson(String source) =>
      NewMovieDataDetailModel.fromMap(json.decode(source));

  MovieShortEntity toEntity() => MovieShortEntity(
      id: id ?? '',
      title: title ?? '',
      year: year ?? '',
      image: image ?? '',
      imDbRating: imDbRating ?? '',
      stars: stars ?? '');
}
