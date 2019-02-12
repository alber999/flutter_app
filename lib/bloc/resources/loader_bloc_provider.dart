import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/blocs/loader_bloc.dart';

class LoaderBlocProvider extends InheritedWidget {
  final _bloc = LoaderBloc();

  LoaderBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static LoaderBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(LoaderBlocProvider) as LoaderBlocProvider)._bloc;
  }
}
