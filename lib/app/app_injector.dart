import 'package:flutter/widgets.dart';
import 'package:flutter_app/loader/blocs/loader_bloc.dart';
import 'package:flutter_app/movies/blocs/movies_bloc.dart';
import 'package:meta/meta.dart';

class AppInjector extends InheritedWidget {
  final MoviesBloc moviesBloc;
  final LoaderBloc loaderBloc;

  AppInjector({
    Key key,
    @required this.moviesBloc,
    @required this.loaderBloc,
    @required Widget child,
  }) : super(key: key, child: child);

  static AppInjector of(BuildContext context) => context.inheritFromWidgetOfExactType(AppInjector);

  @override
  bool updateShouldNotify(AppInjector oldWidget) =>
      moviesBloc != oldWidget.moviesBloc || loaderBloc != oldWidget.loaderBloc;
}
