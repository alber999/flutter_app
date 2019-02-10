import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/blocs/movies_bloc.dart';
import 'package:flutter_app/bloc/models/movie_model.dart';
import 'package:flutter_app/bloc/models/paginated_movie_list_model.dart';
import 'package:flutter_app/bloc/resources/movies_bloc_provider.dart';
import 'package:flutter_app/bloc/ui/widgets/movie_item_widget.dart';

class MovieListWidget extends StatelessWidget {
  final List<MovieModel> _movieList = [];
  final ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    int page = 1;
    final moviesBloc = MoviesBlocProvider.of(context);

    moviesBloc.getAll(page);

    return NotificationListener(
        onNotification: (ScrollNotification notification) {
          _notificationHandler(notification, moviesBloc, page);
        },
        child: StreamBuilder(
          stream: moviesBloc.stream,
          builder: (BuildContext context, AsyncSnapshot<PaginatedMovieListModel> snapshot) {
            if (snapshot.hasData) {
              page++;
              _movieList.addAll(snapshot.data.movieList);
              return _widget();
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }

            return Center(child: CircularProgressIndicator());
          },
        ));
  }

  Widget _widget() {
    return GridView.builder(
        itemCount: _movieList.length,
        padding: const EdgeInsets.all(16.0),
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return MovieItemWidget(_movieList[index]);
        });
  }

  void _notificationHandler(ScrollNotification notification, MoviesBloc moviesBloc, int page) {
    if (notification is ScrollUpdateNotification) {
      if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        moviesBloc.getAll(page);
      }
    }
  }
}
