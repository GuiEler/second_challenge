import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart';
import 'package:second_challenge/domain/entities/entities.dart';
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
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        widget.presenter.scrollOffset = _scrollController.offset;
      });

    widget.presenter.loadComingSoonData();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, screenSize.height * 0.1),
        child: ValueListenableBuilder<double>(
          valueListenable: widget.presenter.scrollNotifier,
          builder: (context, value, _) => CustomAppBar(
            scrollOffset: value,
          ),
        ),
      ),
      body: SafeArea(
          top: false,
          minimum: const EdgeInsets.only(bottom: 16),
          child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  StreamBuilder<MovieShortEntity>(
                    stream: widget.presenter.comingSoonStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data!.id.length > 1) {
                        return ContentHeader(
                          id: snapshot.data!.id,
                          title: snapshot.data!.title,
                          image: snapshot.data!.image,
                        );
                      } else if (snapshot.hasError) {
                        return const SizedBox();
                      } else {
                        return Shimmer.fromColors(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Wrap(
                                spacing: 8,
                                children: [
                                  Container(
                                    width: screenSize.width,
                                    height: screenSize.width * (160 / 110),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            baseColor: Theme.of(context).colorScheme.background,
                            highlightColor:
                                Theme.of(context).colorScheme.secondaryVariant);
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
                                  errorMessage: snapshot.data!.errorMessage!);
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                        TitleCoverScrollView(
                          presenter: StreamTitleCoverPresenter(
                            keywordDataLoader: RemoteLoadKeywordData(
                              url:
                                  '${apiUrl}pt-BR/API/Keyword/$apiSecret/dramas',
                              httpClient: HttpAdapter(
                                client: Client(),
                              ),
                            ),
                          ),
                        ),
                        TitleCoverScrollView(
                          presenter: StreamTitleCoverPresenter(
                            keywordDataLoader: RemoteLoadKeywordData(
                              url:
                                  '${apiUrl}pt-BR/API/Keyword/$apiSecret/anime',
                              httpClient: HttpAdapter(
                                client: Client(),
                              ),
                            ),
                          ),
                        ),
                        TitleCoverScrollView(
                          presenter: StreamTitleCoverPresenter(
                            keywordDataLoader: RemoteLoadKeywordData(
                              url:
                                  '${apiUrl}pt-BR/API/Keyword/$apiSecret/blockbuster',
                              httpClient: HttpAdapter(
                                client: Client(),
                              ),
                            ),
                          ),
                        ),
                        // TitleCoverScrollView(presenter: widget.presenter),
                      ],
                    ),
                  ),
                ],
              ))),
    );
  }
}
