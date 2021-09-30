import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart';
import '../../../shared/shared.dart';
import '../../../data/usecases/usecases.dart';
import '../../../infra/infra.dart';
import '../../../presentation/presenters/presenters.dart';

import 'home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nerdflix'),
        centerTitle: true,
      ),
      body: SafeArea(
          minimum: const EdgeInsets.symmetric(vertical: 16.0),
          child: SizedBox.expand(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox.expand(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TitleCoverScrollView(
                        presenter: StreamHomePresenter(
                          comingSoonLoader: RemoteLoadComingSoon(
                            url: '${apiUrl}pt-BR/API/ComingSoon/$apiSecret',
                            httpClient: HttpAdapter(client: Client()),
                          ),
                          keywordDataLoader: RemoteLoadKeywordData(
                              url:
                                  '${apiUrl}pt-BR/API/Keyword/$apiSecret/dramas',
                              httpClient: HttpAdapter(client: Client())),
                        ),
                        keyword: 'Dramas',
                      ),
                      TitleCoverScrollView(
                        presenter: StreamHomePresenter(
                          comingSoonLoader: RemoteLoadComingSoon(
                            url: '${apiUrl}pt-BR/API/ComingSoon/$apiSecret',
                            httpClient: HttpAdapter(client: Client()),
                          ),
                          keywordDataLoader: RemoteLoadKeywordData(
                            url: '${apiUrl}pt-BR/API/Keyword/$apiSecret/anime',
                            httpClient: HttpAdapter(client: Client()),
                          ),
                        ),
                        keyword: 'Anime',
                      ),
                      TitleCoverScrollView(
                        presenter: StreamHomePresenter(
                          comingSoonLoader: RemoteLoadComingSoon(
                            url: '${apiUrl}pt-BR/API/ComingSoon/$apiSecret',
                            httpClient: HttpAdapter(client: Client()),
                          ),
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
              ),
            ),
          )),
    );
  }
}
