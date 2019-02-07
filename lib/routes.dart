import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/ui/movie_list.dart';
import 'package:flutter_app/home_screen.dart';
import 'package:flutter_app/std/screens/words_std_screen.dart';

class Routes {
  static const String initialRoute = '/';

  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => HomeScreen(),
    '/std': (context) => WordsStdScreen(),
    '/bloc': (context) => MovieList(),
  };
}
