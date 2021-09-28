import 'dart:convert';

class TvEpisodeInfoModel {
  final String? seriesId;
  final String? seriesTitle;
  final String? seriesFullTitle;
  final String? seriesYear;
  final String? seriesYearEnd;
  final String? seasonNumber;
  final String? episodeNumber;
  final String? previousEpisodeId;
  final String? nextEpisodeId;

  TvEpisodeInfoModel({
    this.seriesId,
    this.seriesTitle,
    this.seriesFullTitle,
    this.seriesYear,
    this.seriesYearEnd,
    this.seasonNumber,
    this.episodeNumber,
    this.previousEpisodeId,
    this.nextEpisodeId,
  });

  Map<String, dynamic> toMap() {
    return {
      'seriesId': seriesId,
      'seriesTitle': seriesTitle,
      'seriesFullTitle': seriesFullTitle,
      'seriesYear': seriesYear,
      'seriesYearEnd': seriesYearEnd,
      'seasonNumber': seasonNumber,
      'episodeNumber': episodeNumber,
      'previousEpisodeId': previousEpisodeId,
      'nextEpisodeId': nextEpisodeId,
    };
  }

  factory TvEpisodeInfoModel.fromMap(Map<String, dynamic> map) {
    return TvEpisodeInfoModel(
      seriesId: map['seriesId'],
      seriesTitle: map['seriesTitle'],
      seriesFullTitle: map['seriesFullTitle'],
      seriesYear: map['seriesYear'],
      seriesYearEnd: map['seriesYearEnd'],
      seasonNumber: map['seasonNumber'],
      episodeNumber: map['episodeNumber'],
      previousEpisodeId: map['previousEpisodeId'],
      nextEpisodeId: map['nextEpisodeId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TvEpisodeInfoModel.fromJson(String source) =>
      TvEpisodeInfoModel.fromMap(json.decode(source));
}
