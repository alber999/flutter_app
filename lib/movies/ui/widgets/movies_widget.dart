import 'package:flutter/material.dart';
import 'package:flutter_app/movies/models/movie_model.dart';
import 'package:flutter_app/movies/models/paginated_movies_model.dart';
import 'package:flutter_app/movies/ui/widgets/movies_header_widget.dart';
import 'package:flutter_app/movies/ui/widgets/movies_item_widget.dart';

class MoviesWidget extends StatelessWidget {
  final PaginatedMoviesModel _paginatedMovies;
  final ScrollController _scrollController;

  MoviesWidget(this._paginatedMovies, this._scrollController);

  @override
  Widget build(BuildContext context) {
    final List<MovieModel> movies = List.from(_paginatedMovies.movies);
    movies.removeAt(0);

    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        SliverPersistentHeader(
          delegate: MoviesHeaderWidget(_paginatedMovies.movies[0]),
        ),
        SliverPadding(
            padding: const EdgeInsets.only(top: 4.0, left: 0.0, right: 0.0, bottom: 70.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 190.0,
                mainAxisSpacing: 0.0,
                crossAxisSpacing: 0.0,
                childAspectRatio: 0.75,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(2.0),
                      child: MoviesItemWidget(movies[index]));
                },
                childCount: movies.length,
              ),
            )),
      ],
    );
  }
}
