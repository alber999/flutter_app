import 'dart:async';

import '../models/paginated_movie_list_model.dart';
import 'movie_provider.dart';

class MovieRepository {
  final provider = MovieProvider();

  Future<PaginatedMovieListModel> getAll() => provider.getAll();
}
