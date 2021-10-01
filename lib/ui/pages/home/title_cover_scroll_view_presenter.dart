import '../../../shared/shared.dart';
import '../../../domain/entities/entities.dart';

abstract class TitleCoverScrollViewPresenter {
  Stream<KeywordDataEntity> get keywordDataStream;
  Stream<OnError> get onErrorStream;

  Future<void> loadKeywordData();
}
