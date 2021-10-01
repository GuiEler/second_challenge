import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../data/usecases/usecases.dart';
import '../../infra/infra.dart';
import '../../presentation/presenters/presenters.dart';
import '../../ui/pages/pages.dart';
import '../shared.dart';
import 'vertical_icon_button.dart';

class ContentHeader extends StatelessWidget {
  final String id;
  final String title;
  final String image;
  final bool showButtons;

  const ContentHeader({
    Key? key,
    required this.id,
    required this.title,
    required this.image,
    this.showButtons = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void goToTitleDataPage(String title) {
      Navigator.push(
          context,
          RouteAnimations(
                  route: TitleDataPage(
                    presenter: StreamTitleDataPresenter(
                      titleDataLoader: RemoteLoadTitleData(
                        httpClient: HttpAdapter(
                          client: Client(),
                        ),
                        url: '${apiUrl}pt-BR/API/Title/$apiSecret/$title',
                      ),
                    ),
                  ),
                  duration: 1000,
                  routeName: '/title-data/$title')
              .slide());
    }

    final mediaQuery = MediaQuery.of(context);
    final avaliableWidth = mediaQuery.size.width;
    return Stack(alignment: Alignment.center, children: [
      SizedBox(
        width: avaliableWidth,
        height: avaliableWidth * (160 / 110),
        child: CachedNetworkImage(
          memCacheHeight: 500,
          memCacheWidth: 500,
          imageUrl: image,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
        ),
      ),
      Container(
        width: avaliableWidth,
        height: avaliableWidth * (160 / 110),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter),
        ),
      ),
      Positioned(
        bottom: 110.0,
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline4,
          textAlign: TextAlign.center,
        ),
      ),
      if (showButtons)
        Positioned(
            bottom: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VerticalIconButton(
                    icon: Icons.info_outline,
                    title: 'Info',
                    onTap: () => {goToTitleDataPage(id)})
              ],
            ))
    ]);
  }
}
