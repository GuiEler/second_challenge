import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../../data/usecases/usecases.dart';
import '../../infra/http/http.dart';
import '../../presentation/presenters/presenters.dart';
import '../shared.dart';
import '../../ui/pages/pages.dart';

class TitleCover extends StatefulWidget {
  final String id;
  final String title;
  final String image;

  const TitleCover({
    Key? key,
    required this.id,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  State<TitleCover> createState() => _TitleCoverState();
}

class _TitleCoverState extends State<TitleCover>
    with AutomaticKeepAliveClientMixin {
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

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // final mediaQuery = MediaQuery.of(context);
    // final avaliableHeight = mediaQuery.size.height;
    // final avaliableWidth = mediaQuery.size.width;

    return Stack(children: [
      Container(
        width: 110,
        height: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Theme.of(context).colorScheme.secondaryVariant),
        child: CachedNetworkImage(
          memCacheHeight: 500,
          memCacheWidth: 500,
          imageUrl: widget.image,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          errorWidget: (context, url, error) => Center(
            child: Text(widget.title),
          ),
        ),
      ),
      Positioned.fill(
          child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.white.withOpacity(0.45),
                onTap: () => {goToTitleDataPage(widget.id)},
              ))),
    ]);
  }

  @override
  bool get wantKeepAlive => true;
}
