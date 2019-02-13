import 'dart:async';

import 'package:flutter_app/movies/models/paginated_movies_model.dart';
import 'package:flutter_app/movies/resources/movie_service.dart';

class MovieRepository {
  final _service = MovieService();

  Future<PaginatedMoviesModel> getPage(int page) => _service.getPage(page);
}
