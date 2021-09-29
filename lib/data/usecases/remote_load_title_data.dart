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
  Future<TitleDataEntity> loadTitleData() async {
    final dynamic response = await httpClient.request(url: url, method: 'get');
    return TitleDataModel.fromMap(response).toEntity();
  }
}
