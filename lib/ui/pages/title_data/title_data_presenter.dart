import '../../../domain/entities/entities.dart';

abstract class TitleDataPresenter {
  Stream<TitleDataEntity> get titleDataStream;

  Future<void> loadTitleData();
}
