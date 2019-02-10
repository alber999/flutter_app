import 'dart:async';

import 'package:flutter_app/bloc/models/paginated_movie_list_model.dart';
import 'package:flutter_app/bloc/resources/movie_service.dart';

class MovieRepository {
  final provider = MovieService();

  Future<PaginatedMovieListModel> getAll([int page = 1]) =>
      provider.getAll(page);
}
