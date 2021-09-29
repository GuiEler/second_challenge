import 'package:equatable/equatable.dart';

class MovieShortEntity extends Equatable {
  final String id;
  final String title;
  final String year;
  final String image;
  final String imDbRating;
  final String stars;

  const MovieShortEntity({
    required this.id,
    required this.title,
    required this.year,
    required this.image,
    required this.imDbRating,
    required this.stars,
  });

  @override
  List<Object?> get props => [id, title, year, image, imDbRating, stars];
}
