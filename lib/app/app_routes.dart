import 'package:flutter/material.dart';
import 'package:flutter_app/movies/ui/screens/movies_screen.dart';

class AppRoutes {
  static const String initialRoute = '/';

  static final Map<String, WidgetBuilder> routes = {'/': (context) => MoviesScreen()};
}
