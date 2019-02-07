import 'dart:async';
import 'dart:convert';

import 'package:flutter_app/bloc/config/config.dart';
import 'package:http/http.dart' show Client;

import '../models/paginated_movie_list_model.dart';

class MovieProvider {
  Client client = Client();
  String _apiKey = moviesApiKey;

  Future<PaginatedMovieListModel> getAll() async {
    final response = await client
        .get("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return PaginatedMovieListModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
