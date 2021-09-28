import 'dart:convert';

class ActorShortModel {
  String? id;
  String? image;
  String? name;
  String? asCharacter;

  ActorShortModel({
    this.id,
    this.image,
    this.name,
    this.asCharacter,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'asCharacter': asCharacter,
    };
  }

  factory ActorShortModel.fromMap(Map<String, dynamic> map) {
    return ActorShortModel(
      id: map['id'],
      image: map['image'],
      name: map['name'],
      asCharacter: map['asCharacter'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ActorShortModel.fromJson(String source) =>
      ActorShortModel.fromMap(json.decode(source));
}
