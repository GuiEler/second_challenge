import 'package:flutter/material.dart';

class TitleDataPage extends StatefulWidget {
  const TitleDataPage({Key? key}) : super(key: key);

  @override
  _TitleDataPageState createState() => _TitleDataPageState();
}

class _TitleDataPageState extends State<TitleDataPage> {
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
