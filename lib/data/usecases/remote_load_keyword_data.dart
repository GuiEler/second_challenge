import 'package:second_challenge/data/http/http.dart';
import 'package:second_challenge/data/models/keyword_data/keyword_data.dart';
import 'package:second_challenge/domain/entities/keyword_data.dart';

import '../../domain/usecases/usecases.dart';

class RemoteLoadKeywordData implements LoadKeywordData {
  final HttpClient httpClient;
  final String url;

  RemoteLoadKeywordData({
    required this.httpClient,
    required this.url,
  });

  @override
  Future<List<KeywordDataEntity>> loadKeywordData() async {
    final List<dynamic> response =
        await httpClient.request(url: url, method: 'get');
    return response
        .map((model) =>
            KeywordDataModel.fromMap(model as Map<String, dynamic>).toEntity())
        .toList();
  }
}
