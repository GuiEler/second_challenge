import 'dart:async';

import 'package:flutter/foundation.dart';
import '../../data/http/http.dart';
import '../../domain/usecases/usecases.dart';

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

  final StreamController<ComingSoonEntity> comingSoonStreamController =
      StreamController<ComingSoonEntity>();
  final StreamController<KeywordDataEntity> keywordDataStreamController =
      StreamController<KeywordDataEntity>();

  @override
  Stream<ComingSoonEntity> get comingSoonStream =>
      comingSoonStreamController.stream;

  @override
  Stream<KeywordDataEntity> get keywordDataStream =>
      keywordDataStreamController.stream;

  @override
  Future<void> loadComingSoonData() async {
    try {
      final ComingSoonEntity comingSoon =
          await comingSoonLoader.loadComingSoon();
      comingSoonStreamController.add(comingSoon);
    } on HttpError catch (error) {
      debugPrint('$error');
    }
  }

  @override
  Future<void> loadKeywordData() async {
    try {
      final KeywordDataEntity keywordData =
          await keywordDataLoader.loadKeywordData();
      final KeywordDataEntity obj = KeywordDataEntity(
          keyword: keywordData.keyword,
          errorMessage: keywordData.errorMessage,
          items: keywordData.items
              ?.where((item) => item.image.isNotEmpty)
              .toList());
      keywordDataStreamController.add(obj);
    } on HttpError catch (error) {
      debugPrint('$error');
    }
  }
}
