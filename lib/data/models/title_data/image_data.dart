import 'dart:convert';

import '../models.dart';

class ImageDataModel {
  String? imDbId;
  String? title;
  String? fullTitle;
  String? type;
  String? year;
  List<ImageDataDetailModel>? items;
  String? errorMessage;

  ImageDataModel({
    this.imDbId,
    this.title,
    this.fullTitle,
    this.type,
    this.year,
    this.items,
    this.errorMessage,
  });

  Map<String, dynamic> toMap() {
    return {
      'imDbId': imDbId,
      'title': title,
      'fullTitle': fullTitle,
      'type': type,
      'year': year,
      'items': items?.map((x) => x.toMap()).toList(),
      'errorMessage': errorMessage,
    };
  }

  factory ImageDataModel.fromMap(Map<String, dynamic> map) {
    return ImageDataModel(
      imDbId: map['imDbId'],
      title: map['title'],
      fullTitle: map['fullTitle'],
      type: map['type'],
      year: map['year'],
      items: List<ImageDataDetailModel>.from(
          map['items']?.map((x) => ImageDataDetailModel.fromMap(x))),
      errorMessage: map['errorMessage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageDataModel.fromJson(String source) =>
      ImageDataModel.fromMap(json.decode(source));
}
