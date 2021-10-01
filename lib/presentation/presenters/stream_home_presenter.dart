import 'dart:async';

import 'package:flutter/foundation.dart';
import '../../shared/shared.dart';
import '../../data/http/http.dart';
import '../../domain/usecases/usecases.dart';
import '../../domain/entities/coming_soon.dart';
import '../../ui/pages/home/home_presenter.dart';

class StreamHomePresenter implements HomePresenter {
  final LoadComingSoon comingSoonLoader;

  StreamHomePresenter({
    required this.comingSoonLoader,
  });

  final StreamController<ComingSoonEntity> comingSoonStreamController =
      StreamController<ComingSoonEntity>();
  final StreamController<OnError> onErrorStreamController =
      StreamController<OnError>();

  @override
  Stream<ComingSoonEntity> get comingSoonStream =>
      comingSoonStreamController.stream;

  @override
  Stream<OnError> get onErrorStream => onErrorStreamController.stream;

  @override
  Future<void> loadComingSoonData() async {
    try {
      final ComingSoonEntity comingSoon =
          await comingSoonLoader.loadComingSoon();
      comingSoonStreamController.add(comingSoon);
      if (comingSoon.errorMessage != null) {
        onErrorStreamController
            .add(OnError(errorMessage: comingSoon.errorMessage));
      }
    } on HttpError catch (error) {
      debugPrint('$error');
      onErrorStreamController.add(OnError(errorMessage: '$error'));
    }
  }
}
