import 'dart:convert';

import '../models.dart';

class CastShortModel {
  final String? job;
  final List<CastShortItemModel>? items;

  CastShortModel({
    this.job,
    this.items,
  });

  Map<String, dynamic> toMap() {
    return {
      'job': job,
      'items': items?.map((x) => x.toMap()).toList(),
    };
  }

  factory CastShortModel.fromMap(Map<String, dynamic> map) {
    return CastShortModel(
      job: map['job'],
      items: List<CastShortItemModel>.from(
          map['items']?.map((x) => CastShortItemModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CastShortModel.fromJson(String source) =>
      CastShortModel.fromMap(json.decode(source));
}
