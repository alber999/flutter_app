import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/blocs/movies_bloc.dart';
import 'package:flutter_app/bloc/models/paginated_movie_list_model.dart';
import 'package:flutter_app/bloc/resources/movies_bloc_provider.dart';
import 'package:flutter_app/bloc/ui/widgets/movie_item_widget.dart';

class MovieListWidget extends StatelessWidget {
  final ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    final moviesBloc = MoviesBlocProvider.of(context);
    moviesBloc.getAllNextPage();

    return NotificationListener(
        onNotification: (ScrollNotification notification) {
          _handleNotification(context, notification, moviesBloc);
        },
        child: StreamBuilder(
          stream: moviesBloc.all,
          builder: (BuildContext context, AsyncSnapshot<PaginatedMovieListModel> snapshot) {
            if (snapshot.hasData) {
              return RefreshIndicator(
                  onRefresh: () {
                    return _handleRefresh(moviesBloc);
                  },
                  child: _widget(snapshot));
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }

            return Center(child: CircularProgressIndicator());
          },
        ));
  }

  Widget _widget(AsyncSnapshot<PaginatedMovieListModel> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.movieList.length,
        padding: const EdgeInsets.all(16.0),
        gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200),
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return MovieItemWidget(snapshot.data.movieList[index]);
        });
  }

  _handleNotification(BuildContext context, ScrollNotification notification, MoviesBloc moviesBloc) {
    //print(_scrollController.position.extentAfter);
    if (notification is ScrollEndNotification) {
      if (0 == _scrollController.position.extentAfter) {
        moviesBloc.getAllNextPage();
      }
    }
  }

  _handleRefresh(MoviesBloc moviesBloc) async {
    moviesBloc.reset().getAllNextPage();
  }
}
