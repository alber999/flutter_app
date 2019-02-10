import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/models/movie_model.dart';
import 'package:flutter_app/bloc/models/paginated_movie_list_model.dart';
import 'package:flutter_app/bloc/resources/bloc_provider.dart';
import 'package:flutter_app/bloc/ui/widgets/movie_list_widget.dart';

class MovieListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<MovieModel> _movieList = [];
    final _moviesBloc = BlocProvider.moviesOf(context);

    _moviesBloc.getAll(1);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC Movies'),
      ),
      body: StreamBuilder(
        stream: _moviesBloc.stream,
        builder: (context, AsyncSnapshot<PaginatedMovieListModel> snapshot) {
          if (snapshot.hasData) {
            _movieList.addAll(snapshot.data.movieList);
            return MovieListWidget(_movieList, _moviesBloc, snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
