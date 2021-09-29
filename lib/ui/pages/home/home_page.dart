import 'package:flutter/material.dart';
import 'package:second_challenge/domain/entities/entities.dart';

import 'package:second_challenge/ui/pages/home/home.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;

  const HomePage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.presenter.loadComingSoonData();
    widget.presenter.loadKeywordData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: StreamBuilder<KeywordDataEntity>(
                  stream: widget.presenter.keywordDataStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data!.items!.isNotEmpty) {
                      return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data?.items!.length,
                          itemBuilder: (context, index) => ListTile(
                                title: Text(snapshot.data!.items![index].title),
                                subtitle:
                                    Text(snapshot.data!.items![index].year),
                              ));
                    } else if (snapshot.hasData &&
                        snapshot.data!.items!.isEmpty) {
                      return const Center(
                        child: Text('Nenhum resultado encontrado!'),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
