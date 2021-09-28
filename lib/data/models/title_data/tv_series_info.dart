import 'dart:convert';

import '../models.dart';

class TvSeriesInfoModel {
  final String? yearEnd;
  final String? creators;

  List<StarShortModel>? creatorList;
  List<String>? seasons;

  TvSeriesInfoModel({
    this.yearEnd,
    this.creators,
    this.creatorList,
    this.seasons,
  });

  Map<String, dynamic> toMap() {
    return {
      'yearEnd': yearEnd,
      'creators': creators,
      'creatorList': creatorList?.map((x) => x.toMap()).toList(),
      'seasons': seasons,
    };
  }

  factory TvSeriesInfoModel.fromMap(Map<String, dynamic> map) {
    return TvSeriesInfoModel(
      yearEnd: map['yearEnd'],
      creators: map['creators'],
      creatorList: List<StarShortModel>.from(
          map['creatorList']?.map((x) => StarShortModel.fromMap(x))),
      seasons: List<String>.from(map['seasons']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TvSeriesInfoModel.fromJson(String source) =>
      TvSeriesInfoModel.fromMap(json.decode(source));
}
