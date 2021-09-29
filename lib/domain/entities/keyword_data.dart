import 'package:equatable/equatable.dart';

import 'entities.dart';

class KeywordDataEntity extends Equatable {
  final String keyword;
  final List<MovieShortEntity>? items;
  final String? errorMessage;

  const KeywordDataEntity({
    required this.keyword,
    this.items,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [keyword, items, errorMessage];
}
