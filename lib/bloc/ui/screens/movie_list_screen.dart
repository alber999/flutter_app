import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/blocs/movies_bloc.dart';
import 'package:flutter_app/bloc/models/paginated_movie_list_model.dart';
import 'package:flutter_app/bloc/ui/widgets/movie_list_widget.dart';

class MovieListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int page = 1;
    moviesBloc.getAll(page);
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC Movies'),
      ),
      body: StreamBuilder(
        stream: moviesBloc.stream,
        builder: (context, AsyncSnapshot<PaginatedMovieListModel> snapshot) {
          if (snapshot.hasData) {
            return MovieListWidget(snapshot.data);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
