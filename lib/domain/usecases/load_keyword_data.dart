import '../entities/entities.dart';

abstract class LoadKeywordData {
  Future<KeywordDataEntity> loadKeywordData();
}
