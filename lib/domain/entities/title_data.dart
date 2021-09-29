import 'package:equatable/equatable.dart';

import 'entities.dart';

class TitleDataEntity extends Equatable {
  final String id;
  final String title;
  final String originalTitle;
  final String fullTitle;
  final String type;
  final String year;
  final String image;
  final String releaseDate;
  final String runtimeStr;
  final String genres;
  final String plot;
  final String stars;
  final List<ActorShortEntity>? actorList;
  final String? errorMessage;

  const TitleDataEntity({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.fullTitle,
    required this.type,
    required this.year,
    required this.image,
    required this.releaseDate,
    required this.runtimeStr,
    required this.genres,
    required this.plot,
    required this.stars,
    this.actorList,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        originalTitle,
        fullTitle,
        type,
        year,
        image,
        releaseDate,
        runtimeStr,
        genres,
        plot,
        stars,
        actorList,
        errorMessage
      ];
}
