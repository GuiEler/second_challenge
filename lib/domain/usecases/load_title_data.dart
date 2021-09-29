import '../entities/entities.dart';

abstract class LoadTitleData {
  Future<List<TitleDataEntity>> loadKeywordData();
}
