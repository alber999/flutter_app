import 'package:flutter/material.dart';
import 'package:flutter_app/movies/models/movie_model.dart';

class MovieItemWidget extends StatelessWidget {
  final MovieModel _movie;

  MovieItemWidget(this._movie);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.circular(10.0),
          color: Colors.white,
          image: DecorationImage(
              image: NetworkImage('https://image.tmdb.org/t/p/w185${_movie.posterPath}'),
              fit: BoxFit.cover),
          boxShadow: [
            BoxShadow(color: const Color(0xff3C3261), blurRadius: 5.0, offset: Offset(2.0, 5.0))
          ],
        ),
      ),
    );

    /*return Container(
        margin: EdgeInsets.all(1.0),
        child: CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w185${_movie.posterPath}',
          errorWidget: new Icon(Icons.error),
          fadeOutDuration: new Duration(milliseconds: 300),
          fadeInDuration: new Duration(milliseconds: 300),
          fit: BoxFit.fill,
        ));*/

    //Image.network(
    //'https://image.tmdb.org/t/p/w185${_movie.posterPath}',
    //fit: BoxFit.fill,
    // ));
    /*child: ClipRRect(
          borderRadius: new BorderRadius.circular(6.0),
          child: Image.network(
            'https://image.tmdb.org/t/p/w185${_movie.posterPath}',
            fit: BoxFit.fill,
          )),
    );*/
  }
}
