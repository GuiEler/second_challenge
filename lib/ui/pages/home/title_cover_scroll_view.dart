import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:second_challenge/domain/entities/entities.dart';

import '../../../shared/shared.dart';
import '../pages.dart';

class TitleCoverScrollView extends StatefulWidget {
  final HomePresenter presenter;
  final String keyword;

  const TitleCoverScrollView({
    Key? key,
    required this.presenter,
    required this.keyword,
  }) : super(key: key);

  @override
  _TitleCoverScrollViewState createState() => _TitleCoverScrollViewState();
}

class _TitleCoverScrollViewState extends State<TitleCoverScrollView> {
  void navigateToKeywordTitlesPage(KeywordDataEntity keywordData) {
    Navigator.push(
        context,
        RouteAnimations(
                route: const KeywordTitlesPage(),
                arguments: keywordData,
                duration: 1000,
                routeName: '/keyword-data/${keywordData.keyword}')
            .slide());
  }

  @override
  void initState() {
    widget.presenter.loadComingSoonData();
    widget.presenter.loadKeywordData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final avaliableHeight = mediaQuery.size.height;
    KeywordDataEntity? keywordData;
    // final avaliableWidth = mediaQuery.size.width;
    return SizedBox(
      height: avaliableHeight * 0.27,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.keyword,
                  style: Theme.of(context).textTheme.headline6),
              RichText(
                text: TextSpan(
                  text: 'Ver mais',
                  style: Theme.of(context).textTheme.subtitle2,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      if (keywordData != null) {
                        navigateToKeywordTitlesPage(keywordData!);
                      }
                    },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Expanded(
            child: StreamBuilder<KeywordDataEntity>(
              stream: widget.presenter.keywordDataStream,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.items!.isNotEmpty) {
                  keywordData = snapshot.data!;
                  return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Wrap(spacing: 8.0, children: [
                        for (var i = 0; i < 10; i++)
                          TitleCover(
                              id: snapshot.data!.items![i].id,
                              title: snapshot.data!.items![i].title,
                              image: snapshot.data!.items![i].image)
                      ]));
                } else if (snapshot.hasData && snapshot.data!.items!.isEmpty) {
                  return const Center(
                    child: Text('Nenhum resultado encontrado!'),
                  );
                } else {
                  return Shimmer.fromColors(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Wrap(spacing: 8, children: [
                          for (var i = 0; i < 4; i++)
                            Container(
                              width: 110,
                              height: 160,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            )
                        ]),
                      ),
                      baseColor: Theme.of(context).colorScheme.secondary,
                      highlightColor:
                          Theme.of(context).colorScheme.secondaryVariant);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
