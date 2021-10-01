import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart';
import 'package:second_challenge/domain/entities/coming_soon.dart';
import 'package:second_challenge/presentation/presenters/presenters.dart';
import 'package:shimmer/shimmer.dart';
import '../../../data/usecases/usecases.dart';
import '../../../infra/infra.dart';
import '../../../shared/shared.dart';
import 'home.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;

  const HomePage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        widget.presenter.scrollOffset = _scrollController.offset;
      });
    super.initState();

    widget.presenter.loadComingSoonData();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50),
        child: ValueListenableBuilder<double>(
          valueListenable: widget.presenter.scrollNotifier,
          builder: (context, value, _) => CustomAppBar(
            scrollOffset: value,
          ),
        ),
      ),
      body: SafeArea(
          minimum: const EdgeInsets.only(bottom: 16),
          child: SizedBox.expand(
            child: SizedBox.expand(
              child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      StreamBuilder<ComingSoonEntity>(
                        stream: widget.presenter.comingSoonStream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData &&
                              snapshot.data!.items != null &&
                              snapshot.data!.items!.isNotEmpty) {
                            return ContentHeader(
                              id: snapshot.data!.items![0].id,
                              title: snapshot.data!.items![0].title,
                              image: snapshot.data!.items![0].image,
                            );
                          } else if (snapshot.hasData &&
                              snapshot.data!.items == null &&
                              snapshot.data!.errorMessage == null) {
                            return const Center(
                              child: Text('Nenhum resultado encontrado!'),
                            );
                          } else {
                            return Shimmer.fromColors(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Wrap(
                                    spacing: 8,
                                    children: [
                                      for (var i = 0; i < 4; i++)
                                        Container(
                                          width: screenSize.width,
                                          height:
                                              screenSize.width * (160 / 110),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        )
                                    ],
                                  ),
                                ),
                                baseColor:
                                    Theme.of(context).colorScheme.background,
                                highlightColor: Theme.of(context)
                                    .colorScheme
                                    .secondaryVariant);
                          }
                        },
                      ),
                      SizedBox(
                        height: screenSize.height * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            StreamBuilder<OnError>(
                                stream: widget.presenter.onErrorStream,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    debugPrint('erro detectado');
                                    return CustomDialog(
                                        errorMessage:
                                            snapshot.data!.errorMessage!);
                                  } else {
                                    return const SizedBox();
                                  }
                                }),
                            TitleCoverScrollView(
                              presenter: StreamTitleCoverPresenter(
                                keywordDataLoader: RemoteLoadKeywordData(
                                    url:
                                        '${apiUrl}pt-BR/API/Keyword/$apiSecret/dramas',
                                    httpClient: HttpAdapter(client: Client())),
                              ),
                              keyword: 'Dramas',
                            ),
                            TitleCoverScrollView(
                              presenter: StreamTitleCoverPresenter(
                                keywordDataLoader: RemoteLoadKeywordData(
                                  url:
                                      '${apiUrl}pt-BR/API/Keyword/$apiSecret/anime',
                                  httpClient: HttpAdapter(client: Client()),
                                ),
                              ),
                              keyword: 'Anime',
                            ),
                            TitleCoverScrollView(
                              presenter: StreamTitleCoverPresenter(
                                keywordDataLoader: RemoteLoadKeywordData(
                                  url:
                                      '${apiUrl}pt-BR/API/Keyword/$apiSecret/blockbuster',
                                  httpClient: HttpAdapter(client: Client()),
                                ),
                              ),
                              keyword: 'Blockbuster',
                            ),
                            // TitleCoverScrollView(presenter: widget.presenter),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          )),
    );
  }
}
