import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:second_challenge/domain/entities/entities.dart';
import '../../shared/shared.dart';
import '../../data/http/http.dart';
import '../../domain/usecases/usecases.dart';
import '../../domain/entities/coming_soon.dart';
import '../../ui/pages/home/home_presenter.dart';

class StreamHomePresenter implements HomePresenter {
  final LoadComingSoon comingSoonLoader;
  Timer? changer;

  StreamHomePresenter({
    required this.comingSoonLoader,
  });

  final StreamController<MovieShortEntity> comingSoonStreamController =
      StreamController<MovieShortEntity>();
  final StreamController<OnError> onErrorStreamController =
      StreamController<OnError>();

  void changeComingSoonTitle(List<MovieShortEntity> items) {
    if (changer != null) {
      changer!.cancel();
    }
    var rng = Random();
    int index = 0;
    comingSoonStreamController.add(items[index]);
    changer = Timer.periodic(const Duration(seconds: 10), (timer) {
      index = rng.nextInt(items.length);
      comingSoonStreamController.add(items[index]);
    });
  }

  @override
  Stream<MovieShortEntity> get comingSoonStream =>
      comingSoonStreamController.stream;

  @override
  Stream<OnError> get onErrorStream => onErrorStreamController.stream;

  @override
  Future<void> loadComingSoonData() async {
    try {
      final ComingSoonEntity comingSoon =
          await comingSoonLoader.loadComingSoon();

      if (comingSoon.errorMessage != null &&
          comingSoon.errorMessage!.length > 1) {
        onErrorStreamController
            .add(OnError(errorMessage: comingSoon.errorMessage));
        comingSoonStreamController.addError(Error());
      }
      if (comingSoon.items != null && comingSoon.items!.isNotEmpty) {
        changeComingSoonTitle(comingSoon.items!);
      }
    } on HttpError catch (error) {
      debugPrint('$error');
      onErrorStreamController.add(OnError(errorMessage: '$error'));
    }
  }

  final ValueNotifier<double> _scrollNotifier = ValueNotifier<double>(0);

  @override
  double get scrollOffset => _scrollNotifier.value;

  @override
  set scrollOffset(double value) => _scrollNotifier.value = value;

  @override
  ValueNotifier<double> get scrollNotifier => _scrollNotifier;
}
