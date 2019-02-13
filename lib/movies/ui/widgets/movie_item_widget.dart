import 'package:flutter/material.dart';
import 'package:flutter_app/movies/models/movie_model.dart';

class MovieItemWidget extends StatelessWidget {
  final MovieModel _movie;

  MovieItemWidget(this._movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1.0),
      child: ClipRRect(
          borderRadius: new BorderRadius.circular(6.0),
          child: Image.network(
            'https://image.tmdb.org/t/p/w185${_movie.posterPath}',
            fit: BoxFit.fill,
          )),
    );
  }
}
