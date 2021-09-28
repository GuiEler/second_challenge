import 'dart:convert';

class ImageDataDetailModel {
  final String? title;
  final String? image;

  ImageDataDetailModel({
    this.title,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'image': image,
    };
  }

  factory ImageDataDetailModel.fromMap(Map<String, dynamic> map) {
    return ImageDataDetailModel(
      title: map['title'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageDataDetailModel.fromJson(String source) =>
      ImageDataDetailModel.fromMap(json.decode(source));
}
