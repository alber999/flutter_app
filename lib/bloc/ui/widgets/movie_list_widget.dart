import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/models/paginated_movie_list_model.dart';

class MovieListWidget extends StatelessWidget {
  final AsyncSnapshot<PaginatedMovieListModel> snapshot;

  MovieListWidget(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: snapshot.data.movieList.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            'https://image.tmdb.org/t/p/w185${snapshot.data.movieList[index].poster_path}',
            fit: BoxFit.cover,
          );
        });
  }
}
