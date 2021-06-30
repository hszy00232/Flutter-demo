import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class WordList extends StatefulWidget {
  @override
  _WordListState createState() => _WordListState();
}

class _WordListState extends State<WordList> {
  final _saved = <WordPair>[];
  final _suggestions = <WordPair>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("随机文字列表"),
        actions: [IconButton(onPressed: _pushSaved, icon: Icon(Icons.list))],
      ),
      body: Container(
        child: Builder(
          builder: (BuildContext context) {
            return _buildSuggestion();
          },
        ),
      ),
    );
  }

  Widget _buildSuggestion() {
    return ListView.builder(itemBuilder: (BuildContext _context, int _index) {
      if (_index.isOdd) {
        return Divider();
      }
      // 将_index除以2并返回整数结果
      // 比如1，2，3，4，5返回0，1，1，2，2
      // 用于计算ListView中减去分隔部件后的实际单词对数量
      final i = _index ~/ 2;
      // 当前序列大于列表长度时，列表追加10条数据
      if (i >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[i]);
    });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: TextStyle(fontSize: 18),
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final tiles = _saved.map(
        (WordPair pair) => ListTile(
          title: Text(
            pair.asPascalCase,
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
      final divided =
          ListTile.divideTiles(tiles: tiles, context: context).toList();
      return Scaffold(
        appBar: AppBar(title: Text("Saved Suggestions")),
        body: ListView(
          children: divided,
        ),
      );
    }));
  }
}
