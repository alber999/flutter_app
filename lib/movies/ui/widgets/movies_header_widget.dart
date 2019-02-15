import 'package:flutter/material.dart';
import 'package:flutter_app/movies/models/movie_model.dart';
import 'package:flutter_app/movies/ui/widgets/movies_details_widget.dart';
import 'package:flutter_app/movies/ui/animations/route_animation.dart';

class MoviesHeaderWidget extends StatelessWidget {
  final String _title;
  final MovieModel _movie;
  final ScrollController _scrollController;

  MoviesHeaderWidget(this._title, this._movie, this._scrollController);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(_title),
      centerTitle: true,
      pinned: true,
      backgroundColor: Colors.teal,
      expandedHeight: 490.0,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.vertical_align_top),
          onPressed: () {
            _scrollController.animateTo(
              0.0,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 500),
            );
          },
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
          background: InkResponse(
        enableFeedback: true,
        onTap: () {
          Navigator.push(
            context,
            RouteAnimation(widget: MoviesDetailsWidget(_movie)),
          );
        },
        child: Image.network(
          'https://image.tmdb.org/t/p/w185${_movie.posterPath}',
          fit: BoxFit.cover,
        ),
      )),
    );
  }
}
