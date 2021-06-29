import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class WordList extends StatefulWidget {
  @override
  _WordListState createState() => _WordListState();
}

class _WordListState extends State<WordList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("随机文字列表"),
      ),
      body: Container(
        child: Builder(
          builder: (BuildContext context) {
            final wordPair = WordPair.random();
            return Text(wordPair.toString());
          },
        ),
      ),
    );
  }
}
