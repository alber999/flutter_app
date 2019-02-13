import 'package:flutter_app/movies/models/movie_model.dart';
import 'package:flutter_app/movies/models/pagination_model.dart';

class PaginatedMoviesModel {
  final List<MovieModel> _movies = [];
  PaginationModel _pagination;

  PaginatedMoviesModel();

  PaginatedMoviesModel.fromJson(Map<String, dynamic> parsedJson) {
    _pagination = PaginationModel(parsedJson);
    for (int i = 0; i < parsedJson['results'].length; i++) {
      _movies.add(MovieModel(parsedJson['results'][i]));
    }
  }

  PaginationModel get pagination => _pagination;

  set pagination(PaginationModel pagination) {
    _pagination = pagination;
  }

  List<MovieModel> get movies => _movies;
}
