import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:second_challenge/domain/entities/entities.dart';
import 'package:second_challenge/shared/shared.dart';
import 'package:shimmer/shimmer.dart';

import '../pages.dart';

class TitleDataPage extends StatefulWidget {
  final TitleDataPresenter presenter;

  const TitleDataPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  _TitleDataPageState createState() => _TitleDataPageState();
}

class _TitleDataPageState extends State<TitleDataPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        widget.presenter.scrollOffset = _scrollController.offset;
        debugPrint('${_scrollController.offset}');
      });
    super.initState();
    widget.presenter.loadTitleData();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final avaliableWidth = mediaQuery.size.width;
    final appBar = PreferredSize(
      preferredSize: Size(avaliableWidth, mediaQuery.size.height * 0.08),
      child: ValueListenableBuilder<double>(
        valueListenable: widget.presenter.scrollNotifier,
        builder: (context, value, _) => CustomAppBar(
          scrollOffset: value,
          isHomePage: false,
        ),
      ),
    );

    final avaliableHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar,
      body: SafeArea(
        top: false,
        minimum: const EdgeInsets.only(bottom: 16),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              StreamBuilder<TitleDataEntity>(
                stream: widget.presenter.titleDataStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data!.actorList != null) {
                    return Column(
                      children: [
                        ContentHeader(
                          id: snapshot.data!.id,
                          title: snapshot.data!.title,
                          image: snapshot.data!.image,
                          showButtons: false,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: avaliableHeight * 0.05,
                              ),
                              Text(
                                'Sinopse',
                                style: Theme.of(context).textTheme.headline6,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: avaliableHeight * 0.015,
                              ),
                              Text(
                                snapshot.data!.plot,
                                style: Theme.of(context).textTheme.subtitle1,
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: avaliableHeight * 0.05,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(children: [
                            Row(
                              children: [
                                Text('Elenco',
                                    style:
                                        Theme.of(context).textTheme.headline6)
                              ],
                            ),
                            SizedBox(
                              height: avaliableHeight * 0.015,
                            ),
                            SizedBox(
                              height: avaliableHeight * 0.2,
                              child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => SizedBox(
                                        width: avaliableWidth * 0.3,
                                        child: Column(
                                          children: [
                                            ConstrainedBox(
                                              constraints: const BoxConstraints(
                                                  minWidth: 120,
                                                  minHeight: 120),
                                              child: CircleAvatar(
                                                radius: 32.0,
                                                child: CachedNetworkImage(
                                                  memCacheHeight: 500,
                                                  memCacheWidth: 500,
                                                  imageUrl: snapshot.data!
                                                      .actorList![index].image,
                                                  imageBuilder: (context,
                                                          imageProvider) =>
                                                      Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Theme.of(context)
                                                          .backgroundColor,
                                                      image: DecorationImage(
                                                        image: imageProvider,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          const Center(
                                                              child: Icon(
                                                                  Icons.error)),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              snapshot
                                                  .data!.actorList![index].name,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                            )
                                          ],
                                        ),
                                      ),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        width: 12,
                                      ),
                                  itemCount: snapshot.data!.actorList!.length),
                            ),
                          ]),
                        ),
                      ],
                    );
                  } else if (snapshot.hasData && snapshot.data!.id.isEmpty) {
                    return const Center(
                      child: Text('Nenhum resultado encontrado!'),
                    );
                  } else {
                    return Shimmer.fromColors(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                width: avaliableWidth,
                                height: avaliableWidth * (160 / 110),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(children: [
                                  Row(
                                    children: [
                                      Text('Elenco',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6)
                                    ],
                                  ),
                                  SizedBox(
                                    height: avaliableHeight * 0.015,
                                  ),
                                  SizedBox(
                                    height: avaliableHeight * 0.2,
                                    child: ListView.separated(
                                        physics: const BouncingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) =>
                                            SizedBox(
                                              width: avaliableWidth * 0.3,
                                              child: Column(
                                                children: [
                                                  ConstrainedBox(
                                                      constraints:
                                                          const BoxConstraints(
                                                              minWidth: 120,
                                                              minHeight: 120),
                                                      child: CircleAvatar(
                                                        radius: 32.0,
                                                        child: Container(
                                                          color: Colors.white,
                                                          decoration:
                                                              const BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle),
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            ),
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                              width: 12,
                                            ),
                                        itemCount: 4),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        ),
                        baseColor: Theme.of(context).colorScheme.background,
                        highlightColor:
                            Theme.of(context).colorScheme.secondaryVariant);
                  }
                },
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
