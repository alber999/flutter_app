import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class WordRow extends StatelessWidget {
  final _biggerFont = const TextStyle(fontSize: 18.0);

  final WordPair word;
  final bool isFavorite;
  final GestureTapCallback onTap;

  WordRow({
    @required this.word,
    @required this.isFavorite,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          word.asPascalCase,
          style: _biggerFont,
        ),
        trailing: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: isFavorite ? Colors.red : null,
        ),
        onTap: onTap);
  }
}
