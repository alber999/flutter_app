import 'dart:async';
import 'dart:convert';

import 'package:flutter_app/bloc/config/config.dart';
import 'package:flutter_app/bloc/models/paginated_movie_list_model.dart';
import 'package:flutter_app/bloc/models/pagination_model.dart';
import 'package:http/http.dart' show Client;

class MovieService {
  Client _client = Client();
  String _apiKey = moviesApiKey;

  Future<PaginatedMovieListModel> getAllNextPage(PaginationModel pagination) async {
    final int page = (null != pagination && null != pagination.page) ? pagination.page + 1 : 1;
    final response = await _client.get("https://api.themoviedb.org/3/movie/popular?api_key=$_apiKey&page=$page");
    //print(response.body.toString());
    print("request page: $page");
    if (response.statusCode == 200) {
      return PaginatedMovieListModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
