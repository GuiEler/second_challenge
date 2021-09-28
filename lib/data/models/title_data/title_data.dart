import 'dart:convert';

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
      directorList: List<StarShortModel>.from(
          map['directorList']?.map((x) => StarShortModel.fromMap(x))),
      writers: map['writers'],
      writerList: List<StarShortModel>.from(
          map['writerList']?.map((x) => StarShortModel.fromMap(x))),
      stars: map['stars'],
      startList: List<StarShortModel>.from(
          map['startList']?.map((x) => StarShortModel.fromMap(x))),
      actorList: List<ActorShortModel>.from(
          map['actorList']?.map((x) => ActorShortModel.fromMap(x))),
      fullCast: FullCastDataModel.fromMap(map['fullCast']),
      genres: map['genres'],
      genreList: List<KeyValueItemModel>.from(
          map['genreList']?.map((x) => KeyValueItemModel.fromMap(x))),
      companies: map['companies'],
      companyList: List<CompanyShortModel>.from(
          map['companyList']?.map((x) => CompanyShortModel.fromMap(x))),
      countries: map['countries'],
      countryList: List<KeyValueItemModel>.from(
          map['countryList']?.map((x) => KeyValueItemModel.fromMap(x))),
      languages: map['languages'],
      languageList: List<KeyValueItemModel>.from(
          map['languageList']?.map((x) => KeyValueItemModel.fromMap(x))),
      contentRating: map['contentRating'],
      imDbRating: map['imDbRating'],
      imDbRatingVotes: map['imDbRatingVotes'],
      metacriticRating: map['metacriticRating'],
      ratings: RatingDataModel.fromMap(map['ratings']),
      wikipedia: WikipediaDataModel.fromMap(map['wikipedia']),
      posters: PosterDataModel.fromMap(map['posters']),
      images: ImageDataModel.fromMap(map['images']),
      trailer: TrailerDataModel.fromMap(map['trailer']),
      boxOffice: BoxOfficeShortModel.fromMap(map['boxOffice']),
      tagline: map['tagline'],
      keywords: map['keywords'],
      keywordList: List<String>.from(map['keywordList']),
      similars: List<SimilarShortModel>.from(
          map['similars']?.map((x) => SimilarShortModel.fromMap(x))),
      tvSeriesInfo: TvSeriesInfoModel.fromMap(map['tvSeriesInfo']),
      tvEpisodeInfo: TvEpisodeInfoModel.fromMap(map['tvEpisodeInfo']),
      errorMessage: map['errorMessage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TitleDataModel.fromJson(String source) =>
      TitleDataModel.fromMap(json.decode(source));
}
