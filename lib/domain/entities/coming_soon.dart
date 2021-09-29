import 'package:equatable/equatable.dart';

import 'entities.dart';

class ComingSoonEntity extends Equatable {
  final List<MovieShortEntity>? items;
  final String? errorMessage;

  const ComingSoonEntity({
    this.items,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [items, errorMessage];
}
