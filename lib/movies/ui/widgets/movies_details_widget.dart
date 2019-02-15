import 'package:flutter/material.dart';
import 'package:flutter_app/movies/models/movie_model.dart';

class MoviesDetailsWidget extends StatelessWidget {
  final MovieModel _movie;

  MoviesDetailsWidget(this._movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text(_movie.originalTitle),
          centerTitle: true,
          pinned: true,
          backgroundColor: Colors.teal,
          expandedHeight: 490.0,
          flexibleSpace: FlexibleSpaceBar(
              background: Image.network('https://image.tmdb.org/t/p/w185${_movie.posterPath}',
                  fit: BoxFit.cover)),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          GridTileBar(
              backgroundColor: Colors.black,
              title: Text(_movie.originalTitle,
                  style:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.0)),
              subtitle:
                  Text(_movie.releaseDate, style: TextStyle(color: Colors.white, fontSize: 14.0)),
              trailing: Text(
                '${_movie.voteAverage}/10',
                style: new TextStyle(color: Colors.amberAccent, fontSize: 20.0),
              )),
        ])),
        SliverPadding(
            padding: const EdgeInsets.only(top: 22.0, left: 12.0, right: 12.0, bottom: 22.0),
            sliver: SliverList(
                delegate: SliverChildListDelegate([
              Container(
                  child: Text(_movie.overview,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal))),
            ])))
      ],
    ));
  }
}
