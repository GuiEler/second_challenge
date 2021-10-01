import 'dart:convert';

import 'package:second_challenge/domain/entities/entities.dart';

import '../models.dart';

class TitleDataModel {
  final String? id;
  final String? title;
  final String? originalTitle;
  final String? fullTitle;
  final String? type;
  final String? year;
  final String? image;
  final String? releaseDate;
  final String? runtimeMins;
  final String? runtimeStr;
  final String? plot;
  final String? plotLocal;
  final bool? plotLocalIsRtl;
  final String? awards;
  final String? directors;
  final List<StarShortModel>? directorList;
  final String? writers;
  final List<StarShortModel>? writerList;
  final String? stars;
  final List<StarShortModel>? startList;
  final List<ActorShortModel>? actorList;
  final FullCastDataModel? fullCast;
  final String? genres;
  final List<KeyValueItemModel>? genreList;
  final String? companies;
  final List<CompanyShortModel>? companyList;
  final String? countries;
  final List<KeyValueItemModel>? countryList;
  final String? languages;
  final List<KeyValueItemModel>? languageList;
  final String? contentRating;
  final String? imDbRating;
  final String? imDbRatingVotes;
  final String? metacriticRating;
  final RatingDataModel? ratings;
  final WikipediaDataModel? wikipedia;
  final PosterDataModel? posters;
  final ImageDataModel? images;
  final TrailerDataModel? trailer;
  final BoxOfficeShortModel? boxOffice;
  final String? tagline;
  final String? keywords;
  final List<String>? keywordList;
  final List<SimilarShortModel>? similars;
  final TvSeriesInfoModel? tvSeriesInfo;
  final TvEpisodeInfoModel? tvEpisodeInfo;
  final String? errorMessage;

  TitleDataModel({
    this.id,
    this.title,
    this.originalTitle,
    this.fullTitle,
    this.type,
    this.year,
    this.image,
    this.releaseDate,
    this.runtimeMins,
    this.runtimeStr,
    this.plot,
    this.plotLocal,
    this.plotLocalIsRtl,
    this.awards,
    this.directors,
    this.directorList,
    this.writers,
    this.writerList,
    this.stars,
    this.startList,
    this.actorList,
    this.fullCast,
    this.genres,
    this.genreList,
    this.companies,
    this.companyList,
    this.countries,
    this.countryList,
    this.languages,
    this.languageList,
    this.contentRating,
    this.imDbRating,
    this.imDbRatingVotes,
    this.metacriticRating,
    this.ratings,
    this.wikipedia,
    this.posters,
    this.images,
    this.trailer,
    this.boxOffice,
    this.tagline,
    this.keywords,
    this.keywordList,
    this.similars,
    this.tvSeriesInfo,
    this.tvEpisodeInfo,
    this.errorMessage,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'originalTitle': originalTitle,
      'fullTitle': fullTitle,
      'type': type,
      'year': year,
      'image': image,
      'releaseDate': releaseDate,
      'runtimeMins': runtimeMins,
      'runtimeStr': runtimeStr,
      'plot': plot,
      'plotLocal': plotLocal,
      'plotLocalIsRtl': plotLocalIsRtl,
      'awards': awards,
      'directors': directors,
      'directorList': directorList?.map((x) => x.toMap()).toList(),
      'writers': writers,
      'writerList': writerList?.map((x) => x.toMap()).toList(),
      'stars': stars,
      'startList': startList?.map((x) => x.toMap()).toList(),
      'actorList': actorList?.map((x) => x.toMap()).toList(),
      'fullCast': fullCast?.toMap(),
      'genres': genres,
      'genreList': genreList?.map((x) => x.toMap()).toList(),
      'companies': companies,
      'companyList': companyList?.map((x) => x.toMap()).toList(),
      'countries': countries,
      'countryList': countryList?.map((x) => x.toMap()).toList(),
      'languages': languages,
      'languageList': languageList?.map((x) => x.toMap()).toList(),
      'contentRating': contentRating,
      'imDbRating': imDbRating,
      'imDbRatingVotes': imDbRatingVotes,
      'metacriticRating': metacriticRating,
      'ratings': ratings?.toMap(),
      'wikipedia': wikipedia?.toMap(),
      'posters': posters?.toMap(),
      'images': images?.toMap(),
      'trailer': trailer?.toMap(),
      'boxOffice': boxOffice?.toMap(),
      'tagline': tagline,
      'keywords': keywords,
      'keywordList': keywordList,
      'similars': similars?.map((x) => x.toMap()).toList(),
      'tvSeriesInfo': tvSeriesInfo?.toMap(),
      'tvEpisodeInfo': tvEpisodeInfo?.toMap(),
      'errorMessage': errorMessage,
    };
  }

  factory TitleDataModel.fromMap(Map<String, dynamic> map) {
    return TitleDataModel(
      id: map['id'],
      title: map['title'],
      originalTitle: map['originalTitle'],
      fullTitle: map['fullTitle'],
      type: map['type'],
      year: map['year'],
      image: map['image'],
      releaseDate: map['releaseDate'],
      runtimeMins: map['runtimeMins'],
      runtimeStr: map['runtimeStr'],
      plot: map['plot'],
      plotLocal: map['plotLocal'],
      plotLocalIsRtl: map['plotLocalIsRtl'],
      awards: map['awards'],
      directors: map['directors'],
      directorList: map['directorList'] != null
          ? List<StarShortModel>.from(
              map['directorList']?.map((x) => StarShortModel.fromMap(x)))
          : null,
      writers: map['writers'],
      writerList: map['writerList'] != null
          ? List<StarShortModel>.from(
              map['writerList']?.map((x) => StarShortModel.fromMap(x)))
          : null,
      stars: map['stars'],
      startList: map['startList'] != null
          ? List<StarShortModel>.from(
              map['startList']?.map((x) => StarShortModel.fromMap(x)))
          : null,
      actorList: map['actorList'] != null
          ? List<ActorShortModel>.from(
              map['actorList']?.map((x) => ActorShortModel.fromMap(x)))
          : null,
      fullCast: map['fullCast'] != null
          ? FullCastDataModel.fromMap(map['fullCast'])
          : null,
      genres: map['genres'],
      genreList: map['genreList'] != null
          ? List<KeyValueItemModel>.from(
              map['genreList']?.map((x) => KeyValueItemModel.fromMap(x)))
          : null,
      companies: map['companies'],
      companyList: map['companyList'] != null
          ? List<CompanyShortModel>.from(
              map['companyList']?.map((x) => CompanyShortModel.fromMap(x)))
          : null,
      countries: map['countries'],
      countryList: map['countryList'] != null
          ? List<KeyValueItemModel>.from(
              map['countryList']?.map((x) => KeyValueItemModel.fromMap(x)))
          : null,
      languages: map['languages'],
      languageList: map['languageList'] != null
          ? List<KeyValueItemModel>.from(
              map['languageList']?.map((x) => KeyValueItemModel.fromMap(x)))
          : null,
      contentRating: map['contentRating'],
      imDbRating: map['imDbRating'],
      imDbRatingVotes: map['imDbRatingVotes'],
      metacriticRating: map['metacriticRating'],
      ratings: map['ratings'] != null
          ? RatingDataModel.fromMap(map['ratings'])
          : null,
      wikipedia: map['wikipedia'] != null
          ? WikipediaDataModel.fromMap(map['wikipedia'])
          : null,
      posters: map['posters'] != null
          ? PosterDataModel.fromMap(map['posters'])
          : null,
      images:
          map['images'] != null ? ImageDataModel.fromMap(map['images']) : null,
      trailer: map['trailer'] != null
          ? TrailerDataModel.fromMap(map['trailer'])
          : null,
      boxOffice: map['boxOffice'] != null
          ? BoxOfficeShortModel.fromMap(map['boxOffice'])
          : null,
      tagline: map['tagline'],
      keywords: map['keywords'],
      keywordList: map['keywordList'] != null
          ? List<String>.from(map['keywordList'])
          : null,
      similars: map['similars'] != null
          ? List<SimilarShortModel>.from(
              map['similars']?.map((x) => SimilarShortModel.fromMap(x)))
          : null,
      tvSeriesInfo: map['tvSeriesInfo'] != null
          ? TvSeriesInfoModel.fromMap(map['tvSeriesInfo'])
          : null,
      tvEpisodeInfo: map['tvEpisodeInfo'] != null
          ? TvEpisodeInfoModel.fromMap(map['tvEpisodeInfo'])
          : null,
      errorMessage: map['errorMessage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TitleDataModel.fromJson(String source) =>
      TitleDataModel.fromMap(json.decode(source));

  TitleDataEntity toEntity() => TitleDataEntity(
      id: id ?? '',
      title: title ?? '',
      originalTitle: originalTitle ?? '',
      fullTitle: fullTitle ?? '',
      type: type ?? '',
      year: year ?? '',
      image: image ?? '',
      releaseDate: releaseDate ?? '',
      runtimeStr: runtimeStr ?? '',
      genres: genres ?? '',
      plot: plot ?? (plotLocal ?? ''),
      stars: stars ?? '',
      actorList: actorList?.map((actor) => actor.toEntity()).toList(),
      errorMessage: errorMessage);
}
