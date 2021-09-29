import 'package:flutter/material.dart';

class TitleDetailsPage extends StatefulWidget {
  const TitleDetailsPage({Key? key}) : super(key: key);

  @override
  _TitleDetailsPageState createState() => _TitleDetailsPageState();
}

class _TitleDetailsPageState extends State<TitleDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SizedBox.expand(
        child: Center(
          child: Text('Detalhes'),
        ),
      ),
    );
  }
}
