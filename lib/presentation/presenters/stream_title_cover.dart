import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:second_challenge/shared/shared.dart';
import 'package:second_challenge/ui/pages/home/home.dart';
import '../../data/http/http.dart';
import '../../domain/usecases/usecases.dart';
import '../../domain/entities/keyword_data.dart';
import '../../domain/usecases/load_keyword_data.dart';

class StreamTitleCoverPresenter implements TitleCoverScrollViewPresenter {
  final LoadKeywordData keywordDataLoader;

  StreamTitleCoverPresenter({
    required this.keywordDataLoader,
  });

  final StreamController<OnError> onErrorStreamController =
      StreamController<OnError>();
  final StreamController<KeywordDataEntity> keywordDataStreamController =
      StreamController<KeywordDataEntity>();

  @override
  Stream<OnError> get onErrorStream => onErrorStreamController.stream;

  @override
  Stream<KeywordDataEntity> get keywordDataStream =>
      keywordDataStreamController.stream;

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
      if (keywordData.errorMessage != null) {
        onErrorStreamController
            .add(OnError(errorMessage: keywordData.errorMessage));
      }
    } on HttpError catch (error) {
      debugPrint('$error');
      onErrorStreamController.add(OnError(errorMessage: '$error'));
    }
  }
}
