import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

Widget _buildSuggestion(List<WordPair> suggestions) {
  return ListView.builder(itemBuilder: (BuildContext _context, int _index) {
    if (_index.isOdd) {
      return Divider();
    }

    // 将_index除以2并返回整数结果
    // 比如1，2，3，4，5返回0，1，1，2，2
    // 用于计算ListView中减去分隔部件后的实际单词对数量
    final i = _index ~/ 2;
    // 当前序列大于列表长度时，列表追加10条数据
    if (i >= suggestions.length) {
      suggestions.addAll(generateWordPairs().take(10));
    }
    return _buildRow(suggestions[i]);
  });
}

Widget _buildRow(WordPair pair) {
  return ListTile(
    title: Text(
      pair.asPascalCase,
      style: TextStyle(fontSize: 18),
    ),
  );
}
