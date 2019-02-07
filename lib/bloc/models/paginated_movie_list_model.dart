import 'package:flutter_app/bloc/models/pagination_model.dart';
import 'package:flutter_app/bloc/models/movie_model.dart';

class PaginatedMovieListModel {

  PaginationModel _pagination;
  List<MovieModel> _movieList = [];

  PaginatedMovieListModel.fromJson(Map<String, dynamic> parsedJson) {
    _pagination = PaginationModel(parsedJson);
    for (int i = 0; i < parsedJson['results'].length; i++) {
      _movieList.add(MovieModel(parsedJson['results'][i]));
    }
  }

  PaginationModel get pagination => _pagination;

  List<MovieModel> get movieList => _movieList;
}