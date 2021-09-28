import 'dart:convert';

import '../models.dart';

class WikipediaDataModel {
  final String? imDbId;
  final String? title;
  final String? fullTitle;
  final String? type;
  final String? language;
  final String? titleInLanguage;
  final String? url;
  final WikipediaDataPlotModel? plotShort;
  final WikipediaDataPlotModel? plotFull;
  final String? errorMessage;

  WikipediaDataModel({
    this.imDbId,
    this.title,
    this.fullTitle,
    this.type,
    this.language,
    this.titleInLanguage,
    this.url,
    this.plotShort,
    this.plotFull,
    this.errorMessage,
  });

  Map<String, dynamic> toMap() {
    return {
      'imDbId': imDbId,
      'title': title,
      'fullTitle': fullTitle,
      'type': type,
      'language': language,
      'titleInLanguage': titleInLanguage,
      'url': url,
      'plotShort': plotShort?.toMap(),
      'plotFull': plotFull?.toMap(),
      'errorMessage': errorMessage,
    };
  }

  factory WikipediaDataModel.fromMap(Map<String, dynamic> map) {
    return WikipediaDataModel(
      imDbId: map['imDbId'],
      title: map['title'],
      fullTitle: map['fullTitle'],
      type: map['type'],
      language: map['language'],
      titleInLanguage: map['titleInLanguage'],
      url: map['url'],
      plotShort: WikipediaDataPlotModel.fromMap(map['plotShort']),
      plotFull: WikipediaDataPlotModel.fromMap(map['plotFull']),
      errorMessage: map['errorMessage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WikipediaDataModel.fromJson(String source) =>
      WikipediaDataModel.fromMap(json.decode(source));
}
