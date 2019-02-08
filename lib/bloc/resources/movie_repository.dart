import 'dart:async';
import 'package:flutter_app/bloc/models/paginated_movie_list_model.dart';
import 'package:flutter_app/bloc/resources/movie_provider.dart';

class MovieRepository {
  final provider = MovieProvider();

  Future<PaginatedMovieListModel> getAll() => provider.getAll();
}
