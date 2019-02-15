import 'package:flutter/material.dart';
import 'package:flutter_app/movies/models/movie_model.dart';

class MoviesHeaderTitleWidget extends StatelessWidget {
  final MovieModel _movie;

  MoviesHeaderTitleWidget(this._movie);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      GridTileBar(
          backgroundColor: Colors.black,
          title: Text(_movie.originalTitle,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.0)),
          subtitle: Text(_movie.releaseDate, style: TextStyle(color: Colors.white, fontSize: 14.0)),
          trailing: Text(
            '${_movie.voteAverage}/10',
            style: new TextStyle(color: Colors.amberAccent, fontSize: 20.0),
          ))
    ]));
  }
}
