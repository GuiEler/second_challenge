import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TitleCover extends StatelessWidget {
  final String id;
  final String image;

  const TitleCover({
    Key? key,
    required this.id,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
