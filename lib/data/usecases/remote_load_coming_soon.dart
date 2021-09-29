import '../models/models.dart';
import '../../domain/entities/coming_soon.dart';
import '../http/http.dart';
import '../../domain/usecases/usecases.dart';

class RemoteLoadComingSoon implements LoadComingSoon {
  final HttpClient httpClient;
  final String url;

  RemoteLoadComingSoon({
    required this.httpClient,
    required this.url,
  });

  @override
  Future<ComingSoonEntity> loadComingSoon() async {
    final Map<String, dynamic> response =
        await httpClient.request(url: url, method: 'get');
    return ComingSoonModel.fromMap(response).toEntity();
  }
}
