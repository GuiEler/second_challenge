import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:second_challenge/data/http/http.dart';
import 'package:second_challenge/domain/entities/title_data.dart';
import 'package:second_challenge/domain/usecases/usecases.dart';
import 'package:second_challenge/ui/pages/pages.dart';

class StreamHomePresenter implements TitleDataPresenter {
  final LoadTitleData titleDataLoader;

  StreamHomePresenter({
    required this.titleDataLoader,
  });

  final StreamController<TitleDataEntity> titleDataStreamController =
      StreamController<TitleDataEntity>();

  @override
  Stream<TitleDataEntity> get titleDataStream =>
      titleDataStreamController.stream;

  @override
  Future<void> loadTitleData() async {
    try {
      final TitleDataEntity titleData = await titleDataLoader.loadTitleData();
      titleDataStreamController.add(titleData);
    } on HttpError catch (error) {
      debugPrint('$error');
    }
  }
}
