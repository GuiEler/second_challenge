import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    super.build(context);
    // final mediaQuery = MediaQuery.of(context);
    // final avaliableHeight = mediaQuery.size.height;
    // final avaliableWidth = mediaQuery.size.width;

    return Container(
      width: 110,
      height: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Theme.of(context).colorScheme.secondaryVariant),
      child: CachedNetworkImage(
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
    );
  }

  @override
  bool get wantKeepAlive => true;
}
