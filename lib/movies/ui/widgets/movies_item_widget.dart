import 'package:flutter/material.dart';
import 'package:flutter_app/movies/models/movie_model.dart';
import 'package:flutter_app/movies/ui/animations/route_animation.dart';
import 'package:flutter_app/movies/ui/widgets/movies_details_widget.dart';

class MoviesItemWidget extends StatelessWidget {
  final MovieModel _movie;

  MoviesItemWidget(this._movie);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: InkResponse(
          enableFeedback: true,
          onTap: () {
            Navigator.push(
              context,
              RouteAnimation(widget: MoviesDetailsWidget(_movie)),
            );
          },
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
          )),
    );
  }
}
