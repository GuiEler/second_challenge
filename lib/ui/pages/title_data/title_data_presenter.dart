import '../../../shared/shared.dart';
import '../../../domain/entities/entities.dart';

abstract class TitleDataPresenter {
  Stream<TitleDataEntity> get titleDataStream;
  Stream<OnError> get onErrorStream;

  Future<void> loadTitleData();
}
