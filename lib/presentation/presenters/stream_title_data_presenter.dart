import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:second_challenge/data/http/http.dart';
import 'package:second_challenge/domain/entities/title_data.dart';
import 'package:second_challenge/domain/usecases/usecases.dart';
import 'package:second_challenge/shared/shared.dart';
import 'package:second_challenge/ui/pages/pages.dart';

class StreamTitleDataPresenter implements TitleDataPresenter {
  final LoadTitleData titleDataLoader;

  StreamTitleDataPresenter({
    required this.titleDataLoader,
  });

  final StreamController<TitleDataEntity> titleDataStreamController =
      StreamController<TitleDataEntity>();
  final StreamController<OnError> onErrorStreamController =
      StreamController<OnError>();

  @override
  Stream<TitleDataEntity> get titleDataStream =>
      titleDataStreamController.stream;

  @override
  Stream<OnError> get onErrorStream => onErrorStreamController.stream;

  @override
  Future<void> loadTitleData() async {
    try {
      final TitleDataEntity titleData = await titleDataLoader.loadTitleData();
      titleDataStreamController.add(titleData);
      if (titleData.errorMessage != null &&
          titleData.errorMessage!.length > 1) {
        onErrorStreamController
            .add(OnError(errorMessage: titleData.errorMessage));
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
