import 'package:flutter/material.dart';
import 'package:flutter_app/loader/ui/widgets/loader_widget.dart';
import 'package:flutter_app/movies/ui/widgets/movie_list_widget.dart';

class MovieListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('BLoC Movies')),
        body: Stack(children: <Widget>[MovieListWidget(), LoaderWidget()]));
  }
}
