import 'package:flutter/material.dart';
import 'package:flutter_app/movies/models/paginated_movies_model.dart';
import 'package:flutter_app/movies/ui/widgets/movies_item_widget.dart';

class MoviesWidget extends StatelessWidget {
  final PaginatedMoviesModel _paginatedMovies;
  final ScrollController _scrollController;

  MoviesWidget(this._paginatedMovies, this._scrollController);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: _paginatedMovies.movies.length,
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 70.0),
        //gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (MediaQuery.of(context).size.width / 225).ceil(),
          childAspectRatio: 0.75,
        ),
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return MoviesItemWidget(_paginatedMovies.movies[index]);
        });
  }
}
