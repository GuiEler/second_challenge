import 'package:flutter/material.dart';
import 'package:second_challenge/shared/shared.dart';
import 'package:second_challenge/ui/components/components.dart';
import 'package:second_challenge/ui/pages/home/home.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2000)).then((_) =>
        Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
            RouteAnimations(
                    route: const HomePage(), duration: 1000, routeName: '/home')
                .opacityTransition(0.3),
            (Route<dynamic> route) => false));
    // Navigator.pushNamedAndRemoveUntil(context, '/home', (Route<dynamic> route) => false));
    return Scaffold(
      body: SizedBox.expand(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(AppImages.splashLogo)),
      ),
    );
  }
}
