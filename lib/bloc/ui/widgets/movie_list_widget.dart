import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/blocs/movies_bloc.dart';
import 'package:flutter_app/bloc/models/movie_model.dart';
import 'package:flutter_app/bloc/models/paginated_movie_list_model.dart';
import 'package:flutter_app/bloc/ui/widgets/movie_item_widget.dart';

class MovieListWidget extends StatelessWidget {
  final List<MovieModel> _movieList;
  final MoviesBloc _moviesBloc;
  final AsyncSnapshot<PaginatedMovieListModel> _snapshot;
  final ScrollController _scrollController = new ScrollController();

  MovieListWidget(this._movieList, this._moviesBloc, this._snapshot);

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
        onNotification: _onNotification,
        child: GridView.builder(
            itemCount: _movieList.length,
            padding: const EdgeInsets.all(16.0),
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return MovieItemWidget(_movieList[index]);
            }));
  }

  bool _onNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        _moviesBloc.getAll(_snapshot.data.pagination.page + 1);
      }
    }

    return true;
  }
}
