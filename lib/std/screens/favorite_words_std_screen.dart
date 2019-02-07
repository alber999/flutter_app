import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/std/widgets/favorite_word_row.dart';

class FavoriteWordsStdScreen extends StatelessWidget {
  final Set<WordPair> items;

  FavoriteWordsStdScreen({
    @required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final Iterable<Widget> tiles = items.map(
      (WordPair word) {
        return FavoriteWordRow(word);
      },
    );

    final List<Widget> divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Standard Favorite Words'),
      ),
      body: ListView(children: divided),
    );
  }
}
