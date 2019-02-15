import 'package:flutter/material.dart';
import 'package:flutter_app/movies/models/movie_model.dart';

class MoviesHeaderWidget extends SliverPersistentHeaderDelegate {
  final MovieModel _movie;

  MoviesHeaderWidget(this._movie);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return GridTile(
        footer: GridTileBar(
            backgroundColor: Colors.black54,
            title: Text(_movie.originalTitle,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.0)),
            subtitle:
                Text(_movie.releaseDate, style: TextStyle(color: Colors.white, fontSize: 14.0)),
            trailing: Text(
              '${_movie.voteAverage}/10',
              style: new TextStyle(color: Colors.amberAccent, fontSize: 20.0),
            )),
        child: Image.network(
          'https://image.tmdb.org/t/p/w185${_movie.posterPath}',
          fit: BoxFit.cover,
        ));
  }

  @override
  double get maxExtent => 500.0;

  @override
  double get minExtent => 0.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
