import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:second_challenge/shared/shared.dart';
import 'presentation/presenters/presenters.dart';
import 'data/usecases/usecases.dart';
import 'infra/infra.dart';
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
      themeMode: ThemeMode.dark,
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
              ),
            ),
      },
    );
  }
}
