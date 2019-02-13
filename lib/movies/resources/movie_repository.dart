import 'dart:async';

import 'package:flutter_app/movies/models/paginated_movie_list_model.dart';
import 'package:flutter_app/movies/models/pagination_model.dart';
import 'package:flutter_app/movies/resources/movie_service.dart';

class MovieRepository {
  final _service = MovieService();

  Future<PaginatedMovieListModel> getAllNextPage(PaginationModel pagination) =>
      _service.getAllNextPage(pagination);
}
