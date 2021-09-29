import '../../../domain/entities/entities.dart';

abstract class HomePresenter {
  Stream<List<KeywordDataEntity>> get keywordDataStream;
  Stream<List<ComingSoonEntity>> get comingSoonStream;

  Future<void> loadKeywordData();
  Future<void> loadComingSoonData();
}
