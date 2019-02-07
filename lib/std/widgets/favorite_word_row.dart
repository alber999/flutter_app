import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class FavoriteWordRow extends StatelessWidget {
  final _biggerFont = const TextStyle(fontSize: 18.0);

  final WordPair word;

  FavoriteWordRow(this.word);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        word.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}
