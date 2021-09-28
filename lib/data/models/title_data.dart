import 'dart:html';

class TitleDataModel {
  String? id;
  String? title;
  String? originalTitle;
  String? fullTitle;
  String? type;
  String? year;
  String? image;
  String? releaseDate;
  String? runtimeMins;
  String? runtimeStr;
  String? plot;
  String? plotLocal;
  bool? plotLocalIsRtl;
  String? awards;
  String? directors;
  List<StarShortModel>? directorList;
  String? writers;
  List<StarShortModel>? writerList;
  String? stars;
  List<StarShortModel>? startList;
  List<ActorShortModel>? actorList;
  FullCastDataModel? fullCast;
  String? genres;
  List<KeyValueItemModel>? genreList;
  String? companies;
  List<CompanyShortModel>? companyList;
  String? countries;
  List<KeyValueItemModel>? countryList;
  String? languages;
  List<KeyValueItemModel>? languageList;
  String? contentRating;
  String? imDbRating;
  String? imDbRatingVotes;
  String? metacriticRating;
  RatingDataModel? ratings;
  WikipediaDataModel? wikipedia;
  PosterDataModel? posters;
  ImageDataModel? images;
  TrailerDataModel? trailer;
  BoxOfficeShortModel? boxOffice;
  String? tagline;
  String? keywords;
  List<String>? keywordList;
  List<SimilarShortModel>? similars;
  TvSeriesInfoModel? tvSeriesInfo;
  TvEpisodeInfoModel? tvEpisodeInfo;
  String? errorMessage;
}

class PosterDataModel {
  String? imDbId;
  String? title;
  String? fullTitle;
  String? type;
  String? year;
  List<PosterDataItemModel>? posters;
  List<PosterDataItemModel>? backdrops;
  String? errorMessage;
}

class PosterDataItemModel {
  String? id;
  String? link;
  double? aspectRatio;
  String? language;
  int? width;
  int? height;
}

class TvSeriesInfoModel {
  String? yearEnd;
  String? creators;

  List<StarShortModel>? creatorList;
  List<String>? seasons;
}

class TvEpisodeInfoModel {
  String? seriesId;
  String? seriesTitle;
  String? seriesFullTitle;
  String? seriesYear;
  String? seriesYearEnd;
  String? seasonNumber;
  String? episodeNumber;
  String? previousEpisodeId;
  String? nextEpisodeId;
}

class SimilarShortModel {
  String? id;
  String? title;
  String? image;
}

class StarShortModel {
  String? id;
  String? name;
}

class BoxOfficeShortModel {
  String? budget;
  String? openingWeekendUSA;
  String? grossUSA;
  String? cumulativeWorldwideGross;
}

class CompanyShortModel {
  String? id;
  String? name;
}

class ActorShortModel {
  String? id;
  String? image;
  String? name;
  String? asCharacter;
}

class FullCastDataModel {
  String? imDbId;
  String? title;
  String? fullTitle;
  String? type;
  String? year;
  CastShortModel? directors;
  CastShortModel? writers;
  List<ActorShortModel>? actors;
  List<CastShortModel>? others;
  String? errorMessage;
}

class KeyValueItemModel {
  String? key;
  String? value;
}

class CastShortModel {
  String? job;
  List<CastShortItemModel>? items;
}

class CastShortItemModel {
  String? id;
  String? name;
  String? description;
}

class RatingDataModel {
  String? imDbId;
  String? title;
  String? fullTitle;
  String? type;
  String? year;
  String? imDb;
  String? metacritic;
  String? theMovieDb;
  String? rottenTomatoes;
  String? tVcom;
  String? filmAffinity;
  String? errorMessage;
}

class WikipediaDataModel {
  String? imDbId;
  String? title;
  String? fullTitle;
  String? type;
  String? language;
  String? titleInLanguage;
  String? url;
  WikipediaDataPlotModel? plotShort;
  WikipediaDataPlotModel? plotFull;
  String? errorMessage;
}

class WikipediaDataPlotModel {
  String? plainText;
  String? html;
}

class ImageDataModel {
  String? imDbId;
  String? title;
  String? fullTitle;
  String? type;
  String? year;
  List<ImageDataDetailModel>? items;
  String? errorMessage;
}

class ImageDataDetailModel {
  String? title;
  String? image;
}

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
}
