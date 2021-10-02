import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:second_challenge/domain/entities/entities.dart';

import '../../../shared/shared.dart';
import '../pages.dart';

class TitleCoverScrollView extends StatefulWidget {
  final TitleCoverScrollViewPresenter presenter;

  const TitleCoverScrollView({
    Key? key,
    required this.presenter,
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

  String capitalizeString(String string) {
    return string.substring(0, 1).toUpperCase() +
        string.substring(1, string.length);
  }

  @override
  void initState() {
    super.initState();
    widget.presenter.loadKeywordData();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final avaliableHeight = mediaQuery.size.height;
    // final avaliableWidth = mediaQuery.size.width;
    return SizedBox(
      height: avaliableHeight * 0.3,
      child: Column(
        children: [
          Expanded(
            child: StreamBuilder<KeywordDataEntity>(
              stream: widget.presenter.keywordDataStream,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.items != null) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(capitalizeString(snapshot.data!.keyword),
                              style: Theme.of(context).textTheme.headline6),
                          RichText(
                            text: TextSpan(
                              text: 'Ver mais',
                              style: Theme.of(context).textTheme.subtitle2,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  debugPrint('tap');
                                  navigateToKeywordTitlesPage(snapshot.data!);
                                },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Wrap(spacing: 8.0, children: [
                              for (var i = 0; i < 10; i++)
                                TitleCover(
                                    id: snapshot.data!.items![i].id,
                                    title: snapshot.data!.items![i].title,
                                    image: snapshot.data!.items![i].image)
                            ]),
                          ],
                        ),
                      )
                    ],
                  );
                } else if (snapshot.hasData && snapshot.data!.items == null) {
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
                                color: Theme.of(context).colorScheme.background,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            )
                        ]),
                      ),
                      baseColor: Theme.of(context).colorScheme.background,
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
