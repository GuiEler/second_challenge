import 'package:flutter/cupertino.dart';

import '../../../shared/shared.dart';
import '../../../domain/entities/entities.dart';

abstract class HomePresenter {
  Stream<ComingSoonEntity> get comingSoonStream;
  Stream<OnError> get onErrorStream;

  double get scrollOffset;
  set scrollOffset(double value);
  ValueNotifier<double> get scrollNotifier;

  Future<void> loadComingSoonData();
}
