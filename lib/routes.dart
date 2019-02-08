import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/ui/screens/movie_list_screen.dart';
import 'package:flutter_app/home_screen.dart';
import 'package:flutter_app/std/screens/words_std_screen.dart';

class Routes {
  static const String initialRoute = '/';

  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => HomeScreen(),
    '/std': (context) => WordsStdScreen(),
    '/bloc': (context) => MovieListScreen(),
  };
}
