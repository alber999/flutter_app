import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/models/movie_model.dart';

class MovieItemWidget extends StatelessWidget {
  final MovieModel movie;

  MovieItemWidget(this.movie);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://image.tmdb.org/t/p/w185${movie.poster_path}',
      fit: BoxFit.cover,
    );
  }
}
