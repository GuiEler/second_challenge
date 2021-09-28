import 'dart:convert';

class KeyValueItemModel {
  final String? key;
  final String? value;

  KeyValueItemModel({
    this.key,
    this.value,
  });

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'value': value,
    };
  }

  factory KeyValueItemModel.fromMap(Map<String, dynamic> map) {
    return KeyValueItemModel(
      key: map['key'],
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory KeyValueItemModel.fromJson(String source) =>
      KeyValueItemModel.fromMap(json.decode(source));
}
