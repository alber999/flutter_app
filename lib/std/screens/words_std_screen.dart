import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/std/screens/favorite_words_std_screen.dart';
import 'package:flutter_app/std/widgets/word_row.dart';

class WordsStdScreen extends StatefulWidget {
  @override
  WordsStdScreenState createState() => new WordsStdScreenState();
}

class WordsStdScreenState extends State<WordsStdScreen> {
  final _words = <WordPair>[];
  final Set<WordPair> _favoriteWords = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Standard Words'),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.list), onPressed: _navigateToFavorites),
        ],
      ),
      body: _buildList(),
    );
  }

  void _navigateToFavorites() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                FavoriteWordsStdScreen(items: _favoriteWords)));
  }

  void _onTap(WordPair word, bool isFavorite) {
    setState(() {
      if (isFavorite) {
        _favoriteWords.remove(word);
      } else {
        _favoriteWords.add(word);
      }
    });
  }

  Widget _buildList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= _words.length) {
            _words.addAll(generateWordPairs().take(10));
          }

          final WordPair word = _words[index];
          final bool isFavorite = _favoriteWords.contains(word);

          return WordRow(
              word: word,
              isFavorite: isFavorite,
              onTap: () {
                _onTap(word, isFavorite);
              });
        });
  }
}
