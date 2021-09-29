import '../../../domain/entities/entities.dart';

abstract class HomePresenter {
  Stream<KeywordDataEntity> get keywordDataStream;
  Stream<ComingSoonEntity> get comingSoonStream;

  Future<void> loadKeywordData();
  Future<void> loadComingSoonData();
}
