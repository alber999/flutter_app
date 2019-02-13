import 'dart:async';
import 'dart:convert';

import 'package:flutter_app/app/app_config.dart';
import 'package:flutter_app/movies/models/paginated_movies_model.dart';
import 'package:http/http.dart' show Client;

class MovieService {
  Client _client = Client();
  String _apiKey = moviesApiKey;

  Future<PaginatedMoviesModel> getPage(int page) async {
    final response =
        await _client.get("https://api.themoviedb.org/3/movie/popular?api_key=$_apiKey&page=$page");

    if (response.statusCode == 200) {
      return PaginatedMoviesModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
