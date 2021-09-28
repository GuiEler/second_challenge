import 'dart:convert';

class BoxOfficeShortModel {
  String? budget;
  String? openingWeekendUSA;
  String? grossUSA;
  String? cumulativeWorldwideGross;

  BoxOfficeShortModel({
    this.budget,
    this.openingWeekendUSA,
    this.grossUSA,
    this.cumulativeWorldwideGross,
  });

  Map<String, dynamic> toMap() {
    return {
      'budget': budget,
      'openingWeekendUSA': openingWeekendUSA,
      'grossUSA': grossUSA,
      'cumulativeWorldwideGross': cumulativeWorldwideGross,
    };
  }

  factory BoxOfficeShortModel.fromMap(Map<String, dynamic> map) {
    return BoxOfficeShortModel(
      budget: map['budget'],
      openingWeekendUSA: map['openingWeekendUSA'],
      grossUSA: map['grossUSA'],
      cumulativeWorldwideGross: map['cumulativeWorldwideGross'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BoxOfficeShortModel.fromJson(String source) =>
      BoxOfficeShortModel.fromMap(json.decode(source));
}
