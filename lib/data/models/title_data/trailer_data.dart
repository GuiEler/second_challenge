import 'dart:convert';

class TrailerDataModel {
  String? imDbId;
  String? title;
  String? fullTitle;
  String? type;
  String? year;
  String? videoId;
  String? videoTitle;
  String? videoDescription;
  String? thumbnailUrl;
  String? uploadDate;
  String? link;
  String? linkEmbed;
  String? errorMessage;

  TrailerDataModel({
    this.imDbId,
    this.title,
    this.fullTitle,
    this.type,
    this.year,
    this.videoId,
    this.videoTitle,
    this.videoDescription,
    this.thumbnailUrl,
    this.uploadDate,
    this.link,
    this.linkEmbed,
    this.errorMessage,
  });

  Map<String, dynamic> toMap() {
    return {
      'imDbId': imDbId,
      'title': title,
      'fullTitle': fullTitle,
      'type': type,
      'year': year,
      'videoId': videoId,
      'videoTitle': videoTitle,
      'videoDescription': videoDescription,
      'thumbnailUrl': thumbnailUrl,
      'uploadDate': uploadDate,
      'link': link,
      'linkEmbed': linkEmbed,
      'errorMessage': errorMessage,
    };
  }

  factory TrailerDataModel.fromMap(Map<String, dynamic> map) {
    return TrailerDataModel(
      imDbId: map['imDbId'],
      title: map['title'],
      fullTitle: map['fullTitle'],
      type: map['type'],
      year: map['year'],
      videoId: map['videoId'],
      videoTitle: map['videoTitle'],
      videoDescription: map['videoDescription'],
      thumbnailUrl: map['thumbnailUrl'],
      uploadDate: map['uploadDate'],
      link: map['link'],
      linkEmbed: map['linkEmbed'],
      errorMessage: map['errorMessage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TrailerDataModel.fromJson(String source) =>
      TrailerDataModel.fromMap(json.decode(source));
}
