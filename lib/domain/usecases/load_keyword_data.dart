import '../entities/entities.dart';

abstract class LoadKeywordData {
  Future<List<KeywordDataEntity>> loadKeywordData();
}
