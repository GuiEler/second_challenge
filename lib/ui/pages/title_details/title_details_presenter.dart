import '../../../domain/entities/entities.dart';

abstract class TitleDetailsPresenter {
  Stream<List<TitleDataEntity>> get titleDataStream;

  Future<void> loadTitleData();
}
