import '../models/models.dart';
import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';
import '../http/http.dart';

class RemoteLoadTitleData implements LoadTitleData {
  final HttpClient httpClient;
  final String url;

  RemoteLoadTitleData({
    required this.httpClient,
    required this.url,
  });

  @override
  Future<List<TitleDataEntity>> loadTitleData() async {
    final List<dynamic> response =
        await httpClient.request(url: url, method: 'get');
    return response
        .map((model) =>
            TitleDataModel.fromMap(model as Map<String, dynamic>).toEntity())
        .toList();
  }
}
