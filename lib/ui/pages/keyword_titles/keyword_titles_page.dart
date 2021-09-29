import 'package:flutter/material.dart';

class KeywordTitlesPage extends StatefulWidget {
  const KeywordTitlesPage({Key? key}) : super(key: key);

  @override
  _KeywordTitlesPageState createState() => _KeywordTitlesPageState();
}

class _KeywordTitlesPageState extends State<KeywordTitlesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SizedBox.expand(
        child: Center(
          child: Text('Titles'),
        ),
      ),
    );
  }
}
