import 'package:flutter/material.dart';
import 'package:flutter_app/app/app_injector.dart';
import 'package:flutter_app/app/app_routes.dart';
import 'package:flutter_app/loader/blocs/loader_bloc.dart';
import 'package:flutter_app/movies/blocs/movies_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppInjector(
      moviesBloc: MoviesBloc(),
      loaderBloc: LoaderBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.teal,
        ),
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.routes,
      ),
    );
  }
}
