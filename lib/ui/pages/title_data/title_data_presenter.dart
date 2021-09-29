import '../../../domain/entities/entities.dart';

abstract class TitleDataPresenter {
  Stream<List<TitleDataEntity>> get titleDataStream;

  Future<void> loadTitleData();
}
