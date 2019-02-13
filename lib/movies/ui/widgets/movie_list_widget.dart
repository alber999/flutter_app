import 'package:flutter/material.dart';
import 'package:flutter_app/app/app_injector.dart';
import 'package:flutter_app/loader/blocs/loader_bloc.dart';
import 'package:flutter_app/loader/ui/widgets/progress_indicator_widget.dart';
import 'package:flutter_app/movies/blocs/movies_bloc.dart';
import 'package:flutter_app/movies/models/paginated_movie_list_model.dart';
import 'package:flutter_app/movies/ui/widgets/movie_item_widget.dart';

class MovieListWidget extends StatelessWidget {
  final ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    final MoviesBloc moviesBloc = AppInjector.of(context).moviesBloc;
    final LoaderBloc loaderBloc = AppInjector.of(context).loaderBloc;
    moviesBloc.getAllNextPage();

    return NotificationListener(
        onNotification: (ScrollNotification notification) {
          _handleNotification(context, notification, moviesBloc, loaderBloc);
        },
        child: StreamBuilder(
            stream: moviesBloc.all,
            builder: (BuildContext context, AsyncSnapshot<PaginatedMovieListModel> snapshot) {
              if (snapshot.hasData) {
                loaderBloc.stop();
                return RefreshIndicator(
                    onRefresh: () {
                      return _handleRefresh(moviesBloc);
                    },
                    child: _widget(snapshot));
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }

              return ProgressIndicatorWidget();
            }));
  }

  Widget _widget(AsyncSnapshot<PaginatedMovieListModel> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.movieList.length,
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 70.0),
        gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200),
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return MovieItemWidget(snapshot.data.movieList[index]);
        });
  }

  _handleNotification(BuildContext context, ScrollNotification notification, MoviesBloc moviesBloc,
      LoaderBloc loaderBloc) {
    if (notification is ScrollEndNotification) {
      if (0 == _scrollController.position.extentAfter) {
        loaderBloc.start();
        moviesBloc.getAllNextPage();
      }
    }
  }

  _handleRefresh(MoviesBloc moviesBloc) async {
    moviesBloc.reset().getAllNextPage();
  }
}