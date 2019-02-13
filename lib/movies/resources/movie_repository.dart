import 'dart:async';

import 'package:flutter_app/movies/models/paginated_movies_model.dart';
import 'package:flutter_app/movies/models/pagination_model.dart';
import 'package:flutter_app/movies/resources/movie_service.dart';

class MovieRepository {
  final _service = MovieService();

  Future<PaginatedMoviesModel> getPage(PaginationModel pagination) {
    final int page = (null != pagination && null != pagination.page) ? pagination.page + 1 : 1;
    print("request page: $page");

    return _service.getPage(page);
  }
}
