import 'package:flutter/material.dart';

import '../blocs/movies_bloc.dart';
import '../models/paginated_movie_list_model.dart';

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    moviesBloc.getAll();
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC Movies'),
      ),
      body: StreamBuilder(
        stream: moviesBloc.stream,
        builder: (context, AsyncSnapshot<PaginatedMovieListModel> snapshot) {
          if (snapshot.hasData) {
            return _buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildList(AsyncSnapshot<PaginatedMovieListModel> snapshot) {
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
