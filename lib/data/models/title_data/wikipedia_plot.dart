import 'dart:convert';

class WikipediaDataPlotModel {
  String? plainText;
  String? html;

  WikipediaDataPlotModel({
    this.plainText,
    this.html,
  });

  Map<String, dynamic> toMap() {
    return {
      'plainText': plainText,
      'html': html,
    };
  }

  factory WikipediaDataPlotModel.fromMap(Map<String, dynamic> map) {
    return WikipediaDataPlotModel(
      plainText: map['plainText'],
      html: map['html'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WikipediaDataPlotModel.fromJson(String source) =>
      WikipediaDataPlotModel.fromMap(json.decode(source));
}
