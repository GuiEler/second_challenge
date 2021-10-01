import 'package:flutter/foundation.dart';
import '../../../shared/shared.dart';
import '../../../domain/entities/entities.dart';

abstract class TitleDataPresenter {
  Stream<TitleDataEntity> get titleDataStream;
  Stream<OnError> get onErrorStream;
  double get scrollOffset;
  set scrollOffset(double value);
  ValueNotifier<double> get scrollNotifier;

  Future<void> loadTitleData();
}
