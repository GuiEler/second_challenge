import '../../domain/entities/coming_soon.dart';
import '../../domain/entities/keyword_data.dart';
import '../../domain/usecases/load_keyword_data.dart';
import '../../ui/pages/home/home_presenter.dart';

class StreamHomePresenter implements HomePresenter {
  final LoadKeywordData keywordDataLoader;

  StreamHomePresenter({
    required this.keywordDataLoader,
  });

  @override
  Stream<List<ComingSoonEntity>> get comingSoonStream =>
      throw UnimplementedError();

  @override
  Stream<List<KeywordDataEntity>> get keywordDataStream =>
      throw UnimplementedError();

  @override
  Future<void> loadComingSoonData() {
    throw UnimplementedError();
  }

  @override
  Future<void> loadKeywordData() {
    throw UnimplementedError();
  }
}
