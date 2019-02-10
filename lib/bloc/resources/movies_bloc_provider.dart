import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/blocs/movies_bloc.dart';

class MoviesBlocProvider extends InheritedWidget {
  final _bloc = MoviesBloc();

  MoviesBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static MoviesBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(MoviesBlocProvider)
            as MoviesBlocProvider)
        ._bloc;
  }
}
