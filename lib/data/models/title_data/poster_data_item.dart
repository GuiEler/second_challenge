import 'dart:convert';

class PosterDataItemModel {
  String? id;
  String? link;
  double? aspectRatio;
  String? language;
  int? width;
  int? height;

  PosterDataItemModel({
    this.id,
    this.link,
    this.aspectRatio,
    this.language,
    this.width,
    this.height,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'link': link,
      'aspectRatio': aspectRatio,
      'language': language,
      'width': width,
      'height': height,
    };
  }

  factory PosterDataItemModel.fromMap(Map<String, dynamic> map) {
    return PosterDataItemModel(
      id: map['id'],
      link: map['link'],
      aspectRatio: map['aspectRatio'],
      language: map['language'],
      width: map['width'],
      height: map['height'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PosterDataItemModel.fromJson(String source) =>
      PosterDataItemModel.fromMap(json.decode(source));
}
