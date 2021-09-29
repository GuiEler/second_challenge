import 'dart:convert';

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
  final String? diretors;
  final List<StarShortModel>? diretorList;
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
    this.diretors,
    this.diretorList,
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
      'diretors': diretors,
      'diretorList': diretorList?.map((x) => x.toMap()).toList(),
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
      diretors: map['diretors'],
      diretorList: List<StarShortModel>.from(
          map['diretorList']?.map((x) => StarShortModel.fromMap(x))),
      stars: map['stars'],
      starList: List<StarShortModel>.from(
          map['starList']?.map((x) => StarShortModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory NewMovieDataDetailModel.fromJson(String source) =>
      NewMovieDataDetailModel.fromMap(json.decode(source));
}