import 'dart:convert';

import '../models.dart';

class ComingSoonModel {
  final List<NewMovieDataDetailModel>? items;
  final String? errorMessage;

  ComingSoonModel({
    this.items,
    this.errorMessage,
  });

  Map<String, dynamic> toMap() {
    return {
      'items': items?.map((x) => x.toMap()).toList(),
      'errorMessage': errorMessage,
    };
  }

  factory ComingSoonModel.fromMap(Map<String, dynamic> map) {
    return ComingSoonModel(
      items: List<NewMovieDataDetailModel>.from(
          map['items']?.map((x) => NewMovieDataDetailModel.fromMap(x))),
      errorMessage: map['errorMessage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ComingSoonModel.fromJson(String source) =>
      ComingSoonModel.fromMap(json.decode(source));
}
