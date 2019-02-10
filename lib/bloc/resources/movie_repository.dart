import 'dart:async';

import 'package:flutter_app/bloc/models/paginated_movie_list_model.dart';
import 'package:flutter_app/bloc/resources/movie_service.dart';

class MovieRepository {
  final service = MovieService();

  Future<PaginatedMovieListModel> getAll(int page) => service.getAll(page);
}
