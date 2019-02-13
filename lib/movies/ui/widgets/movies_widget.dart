import 'package:flutter/material.dart';
import 'package:flutter_app/movies/models/paginated_movies_model.dart';
import 'package:flutter_app/movies/ui/widgets/movies_item_widget.dart';

class MoviesWidget extends StatelessWidget {
  final PaginatedMoviesModel _paginatedMovies;
  final ScrollController _scrollController;

  MoviesWidget(this._paginatedMovies, this._scrollController);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        SliverPersistentHeader(
          delegate: MyCollapsingImage(
              'https://image.tmdb.org/t/p/w185${_paginatedMovies.movies[0].posterPath}'),
        ),
        SliverPadding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0, bottom: 70.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 180.0,
                mainAxisSpacing: 0.0,
                crossAxisSpacing: 0.0,
                childAspectRatio: 0.75,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(4.0),
                      child: MoviesItemWidget(_paginatedMovies.movies[index]));
                },
                childCount: _paginatedMovies.movies.length,
              ),
            )),
      ],
    );

    /*return GridView.builder(
        itemCount: _paginatedMovies.movies.length,
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 70.0),
        //gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (MediaQuery.of(context).size.width / 225).ceil(),
          childAspectRatio: 0.75,
        ),
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return MoviesItemWidget(_paginatedMovies.movies[index]);
        });*/
  }
}

class MyCollapsingImage extends SliverPersistentHeaderDelegate {
  final String _image;

  MyCollapsingImage(this._image);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Image.network(
      _image,
      fit: BoxFit.cover,
    );
  }

  @override
  double get maxExtent => 300.0;

  @override
  double get minExtent => 0.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
