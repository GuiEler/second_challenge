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
  Future<List<ComingSoonEntity>> loadComingSoon() async {
    final List<dynamic> response =
        await httpClient.request(url: url, method: 'get');
    return response
        .map((model) =>
            ComingSoonModel.fromMap(model as Map<String, dynamic>).toEntity())
        .toList();
  }
}
