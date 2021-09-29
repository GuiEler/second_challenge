import 'dart:async';

import 'package:flutter/foundation.dart';
import '../../data/http/http.dart';
import 'package:second_challenge/domain/usecases/load_coming_soon_data.dart';

import '../../domain/entities/coming_soon.dart';
import '../../domain/entities/keyword_data.dart';
import '../../domain/usecases/load_keyword_data.dart';
import '../../ui/pages/home/home_presenter.dart';

class StreamHomePresenter implements HomePresenter {
  final LoadKeywordData keywordDataLoader;
  final LoadComingSoon comingSoonLoader;

  StreamHomePresenter({
    required this.keywordDataLoader,
    required this.comingSoonLoader,
  });

  final StreamController<List<ComingSoonEntity>> comingSoonStreamController =
      StreamController<List<ComingSoonEntity>>();
  final StreamController<List<KeywordDataEntity>> keywordDataStreamController =
      StreamController<List<KeywordDataEntity>>();

  @override
  Stream<List<ComingSoonEntity>> get comingSoonStream =>
      comingSoonStreamController.stream;

  @override
  Stream<List<KeywordDataEntity>> get keywordDataStream =>
      keywordDataStreamController.stream;

  @override
  Future<void> loadComingSoonData() async {
    try {
      final List<ComingSoonEntity> comingSoon =
          await comingSoonLoader.loadComingSoon();
      comingSoonStreamController.add(comingSoon);
    } on HttpError catch (error) {
      debugPrint('$error');
    }
  }

  @override
  Future<void> loadKeywordData() async {
    try {
      final List<KeywordDataEntity> keywordData =
          await keywordDataLoader.loadKeywordData();
      keywordDataStreamController.add(keywordData);
    } on HttpError catch (error) {
      debugPrint('$error');
    }
  }
}
