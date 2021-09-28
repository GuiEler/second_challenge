class KeywordDataModel {
  String? keyword;
  List<MovieShortModel>? items;
  String? errorMessage;

  KeywordDataModel({
    this.keyword,
    this.items,
    this.errorMessage,
  });
}

class MovieShortModel {
  String? id;
  String? title;
  String? year;
  String? image;
  String? imDbRating;

  MovieShortModel({
    this.id,
    this.title,
    this.year,
    this.image,
    this.imDbRating,
  });
}
