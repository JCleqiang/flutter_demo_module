import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ListDemo extends StatefulWidget {
  @override
  ListDemoState createState() {
    // TODO: implement createState
    return new ListDemoState();
  }
}

class ListDemoState extends State<ListDemo> {
  // 所有的列表
  final _suggestions = <WordPair>[];
  // 收藏的列表
  final _saved = new Set<WordPair>();
  //
  final _biggerFont = const TextStyle(fontSize: 18.0);


  @override
  Widget build(BuildContext context) {
    return _buildSuggestions();
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (BuildContext context, int index) {
        // 在每一列之前，添加一个1像素高的分隔线widget
        if (index.isOdd) {
          return new Divider();
        }

        // 语法 "index ~/ 2" 表示index除以2，但返回值是整形（向下取整）
        final i = index ~/ 2;

        // 如果是建议列表中最后一个单词对
        if (i >= _suggestions.length) {
          // ...接着再生成10个单词对，然后添加到建议列表
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_suggestions[i]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);

    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          alreadySaved? _saved.remove(pair): _saved.add(pair);
        });
      },
    );
  }
}