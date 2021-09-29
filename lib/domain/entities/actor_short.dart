import 'package:equatable/equatable.dart';

class ActorShortEntity extends Equatable {
  final String id;
  final String name;
  final String image;
  final String asCharacter;

  const ActorShortEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.asCharacter,
  });

  @override
  List<Object?> get props => [id, name, image, asCharacter];
}
