import 'package:flutter/material.dart';
import 'package:second_challenge/domain/entities/entities.dart';
import 'package:second_challenge/shared/shared.dart';

class KeywordTitlesPage extends StatefulWidget {
  const KeywordTitlesPage({Key? key}) : super(key: key);

  @override
  _KeywordTitlesPageState createState() => _KeywordTitlesPageState();
}

class _KeywordTitlesPageState extends State<KeywordTitlesPage> {
  String capitalizeString(String string) {
    return string.substring(0, 1).toUpperCase() +
        string.substring(1, string.length);
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as KeywordDataEntity;
    final mediaQuery = MediaQuery.of(context).size;
    final avaliableWidth = mediaQuery.width;
    final avaliableHeight = mediaQuery.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(avaliableWidth, avaliableHeight * 0.1),
        child: const CustomAppBar(
          isHomePage: false,
          scrollOffset: 0,
        ),
      ),
      body: SafeArea(
        top: false,
        minimum: EdgeInsets.only(bottom: 16.0, top: avaliableHeight * 0.05),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: avaliableWidth * 0.92,
                      maxHeight: avaliableHeight * 0.1,
                    ),
                    child: Text(
                      capitalizeString(arguments.keyword),
                      style: Theme.of(context).textTheme.headline4,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              Expanded(
                  child: GridView.builder(
                cacheExtent: 9999,
                physics: const BouncingScrollPhysics(),
                itemCount: arguments.items!.length,
                itemBuilder: (BuildContext context, int index) {
                  return TitleCover(
                      id: arguments.items![index].id,
                      title: arguments.items![index].title,
                      image: arguments.items![index].image);
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 110 / 160,
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 20,
                ),
                padding: const EdgeInsets.all(10),
              )

                  // child: GridView.count(
                  //   addAutomaticKeepAlives: false,
                  //   addRepaintBoundaries: false,
                  //   childAspectRatio: 110 / 160,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   crossAxisCount: 3,
                  //   crossAxisSpacing: 16,
                  //   mainAxisSpacing: 20,
                  //   children: arguments.items!
                  //       .map((item) => TitleCover(
                  //           id: item.id, title: item.title, image: item.image))
                  //       .toList(),
                  // ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
