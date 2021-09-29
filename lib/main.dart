import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'infra/http/http.dart';
import 'data/usecases/usecases.dart';
import 'presentation/presenters/presenters.dart';

import 'shared/shared.dart';
import 'ui/components/components.dart';

import 'ui/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      title: 'Use Academy',
      theme: AppTheme.lightThemeData,
      darkTheme: AppTheme.darkThemeData,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/home': (context) => HomePage(
              presenter: StreamHomePresenter(
                comingSoonLoader: RemoteLoadComingSoon(
                  url: '${apiUrl}pt-BR/API/ComingSoon/$apiSecret',
                  httpClient: HttpAdapter(client: Client()),
                ),
                keywordDataLoader: RemoteLoadKeywordData(
                    url: '${apiUrl}pt-BR/API/Keyword/$apiSecret/dramas',
                    httpClient: HttpAdapter(client: Client())),
              ),
            ),
        '/title-data': (context) => const TitleDataPage(),
        '/keyword-titles': (context) => const KeywordTitlesPage()
      },
    );
  }
}
