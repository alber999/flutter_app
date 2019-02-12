import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/resources/loader_bloc_provider.dart';
import 'package:flutter_app/bloc/resources/movies_bloc_provider.dart';
import 'package:flutter_app/bloc/ui/widgets/loader_widget.dart';
import 'package:flutter_app/bloc/ui/widgets/movie_list_widget.dart';

class MovieListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('BLoC Movies')),
        body: LoaderBlocProvider(
            child: MoviesBlocProvider(child: Stack(children: <Widget>[MovieListWidget(), LoaderWidget()]))));
  }
}
