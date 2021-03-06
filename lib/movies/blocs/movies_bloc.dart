import 'package:flutter_app/movies/models/paginated_movies_model.dart';
import 'package:flutter_app/movies/models/pagination_model.dart';
import 'package:flutter_app/movies/resources/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final PaginatedMoviesModel _paginatedMovies = PaginatedMoviesModel();
  final _repository = MovieRepository();
  final _subject = BehaviorSubject<PaginatedMoviesModel>();

  Observable<PaginatedMoviesModel> get all => _subject.stream;

  MoviesBloc reset() {
    _paginatedMovies.movies.clear();
    _paginatedMovies.pagination = PaginationModel();
    return this;
  }

  getAllNextPage() async {
    final PaginatedMoviesModel data = await _repository.getAllNextPage(_paginatedMovies.pagination);

    //uncomment to add delay to stream
    //Future.delayed(const Duration(milliseconds: 1000), () {
    _paginatedMovies.movies.addAll(data.movies);
    _paginatedMovies.pagination = data.pagination;
    _subject.sink.add(_paginatedMovies);
    //});
  }

  bool hasData() {
    return _paginatedMovies.movies.isNotEmpty;
  }

  dispose() {
    _subject?.close();
  }
}
