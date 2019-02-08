import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/models/paginated_movie_list_model.dart';
import 'package:flutter_app/bloc/ui/widgets/movie_item_widget.dart';

class MovieListWidget extends StatelessWidget {
  final PaginatedMovieListModel paginatedMovieList;

  MovieListWidget(this.paginatedMovieList);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: paginatedMovieList.movieList.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return MovieItemWidget(paginatedMovieList.movieList[index]);
        });
  }
}
