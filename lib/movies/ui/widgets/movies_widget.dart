import 'package:flutter/material.dart';
import 'package:flutter_app/movies/models/movie_model.dart';
import 'package:flutter_app/movies/ui/widgets/movies_header_title_widget.dart';
import 'package:flutter_app/movies/ui/widgets/movies_header_widget.dart';
import 'package:flutter_app/movies/ui/widgets/movies_item_widget.dart';

class MoviesWidget extends StatelessWidget {
  final MovieModel _headerMovie;
  final List<MovieModel> _movies;
  final ScrollController _scrollController;

  MoviesWidget(this._headerMovie, this._movies, this._scrollController);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        MoviesHeaderWidget('Popular Movies', _headerMovie, _scrollController),
        MoviesHeaderTitleWidget(_headerMovie),
        SliverPadding(
            padding: const EdgeInsets.only(top: 4.0, left: 0.0, right: 0.0, bottom: 70.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 190.0,
                mainAxisSpacing: 0.0,
                crossAxisSpacing: 0.0,
                childAspectRatio: 0.75,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(2.0),
                      child: MoviesItemWidget(_movies[index]));
                },
                childCount: _movies.length,
              ),
            )),
      ],
    );
  }
}
