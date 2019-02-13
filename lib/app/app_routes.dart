import 'package:flutter/material.dart';
import 'package:flutter_app/movies/ui/screens/movie_list_screen.dart';

class AppRoutes {
  static const String initialRoute = '/';

  static final Map<String, WidgetBuilder> routes = {'/': (context) => MovieListScreen()};
}
