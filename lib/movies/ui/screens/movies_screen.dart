import 'package:flutter/material.dart';
import 'package:flutter_app/app/app_injector.dart';
import 'package:flutter_app/loader/blocs/loader_bloc.dart';
import 'package:flutter_app/loader/ui/widgets/loader_widget.dart';
import 'package:flutter_app/loader/ui/widgets/progress_indicator_widget.dart';
import 'package:flutter_app/movies/blocs/movies_bloc.dart';
import 'package:flutter_app/movies/models/paginated_movies_model.dart';
import 'package:flutter_app/movies/ui/widgets/movies_widget.dart';

class MoviesScreen extends StatelessWidget {
  final ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    final MoviesBloc moviesBloc = AppInjector
        .of(context)
        .moviesBloc;
    final LoaderBloc loaderBloc = AppInjector
        .of(context)
        .loaderBloc;

    return Scaffold(
        appBar: AppBar(title: Text('BLoC Movies')),
        body: Stack(children: <Widget>[
          _moviesWidget(context, moviesBloc, loaderBloc),
          _loaderWidget(loaderBloc)
        ]));
  }

  Widget _moviesWidget(BuildContext context, MoviesBloc moviesBloc, LoaderBloc loaderBloc) {
    moviesBloc.getAllNextPage();
    return NotificationListener(
        onNotification: (ScrollNotification notification) {
          _handleNotification(context, notification, moviesBloc, loaderBloc);
        },
        child: StreamBuilder(
            stream: moviesBloc.all,
            builder: (BuildContext context, AsyncSnapshot<PaginatedMoviesModel> snapshot) {
              if (snapshot.hasData) {
                loaderBloc.stop();
                return RefreshIndicator(
                    onRefresh: () {
                      return _handleRefresh(moviesBloc);
                    },
                    child: MoviesWidget(snapshot.data, _scrollController));
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }

              return ProgressIndicatorWidget();
            }));
  }

  Widget _loaderWidget(LoaderBloc loaderBloc) {
    return StreamBuilder(
        stream: loaderBloc.isLoading,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          return LoaderWidget(snapshot.hasData ? snapshot.data : false);
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
