import 'dart:convert';

import '../models.dart';

class KeywordDataModel {
  final String? keyword;
  final List<MovieShortModel>? items;
  final String? errorMessage;

  KeywordDataModel({
    this.keyword,
    this.items,
    this.errorMessage,
  });

  Map<String, dynamic> toMap() {
    return {
      'keyword': keyword,
      'items': items?.map((x) => x.toMap()).toList(),
      'errorMessage': errorMessage,
    };
  }

  factory KeywordDataModel.fromMap(Map<String, dynamic> map) {
    return KeywordDataModel(
      keyword: map['keyword'],
      items: List<MovieShortModel>.from(
          map['items']?.map((x) => MovieShortModel.fromMap(x))),
      errorMessage: map['errorMessage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory KeywordDataModel.fromJson(String source) =>
      KeywordDataModel.fromMap(json.decode(source));
}
