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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox.expand(
          child: StreamBuilder<TitleDataEntity>(
              stream: widget.presenter.titleDataStream,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.id.isNotEmpty) {
                  return const SingleChildScrollView(
                      physics: BouncingScrollPhysics(), child: null);
                } else if (snapshot.hasData && snapshot.data!.id.isEmpty) {
                  return const Center(
                    child: Text('Nenhum resultado encontrado!'),
                  );
                } else {
                  return Shimmer.fromColors(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Wrap(spacing: 8, children: [
                          for (var i = 0; i < 4; i++)
                            Container(
                              width: 110,
                              height: 160,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            )
                        ]),
                      ),
                      baseColor: Theme.of(context).colorScheme.secondary,
                      highlightColor:
                          Theme.of(context).colorScheme.secondaryVariant);
                }
              })),
    );
  }
}
