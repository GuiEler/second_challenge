import 'package:flutter/material.dart';

class KeywordTitles extends StatefulWidget {
  const KeywordTitles({Key? key}) : super(key: key);

  @override
  _KeywordTitlesState createState() => _KeywordTitlesState();
}

class _KeywordTitlesState extends State<KeywordTitles> {
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
