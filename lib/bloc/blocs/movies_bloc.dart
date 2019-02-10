import 'package:flutter_app/bloc/models/movie_model.dart';
import 'package:flutter_app/bloc/models/paginated_movie_list_model.dart';
import 'package:flutter_app/bloc/resources/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final List<MovieModel> _movieList = [];
  final _repository = MovieRepository();
  final _subject = BehaviorSubject<PaginatedMovieListModel>();

  Observable<PaginatedMovieListModel> get all => _subject.stream;

  getAll([int page]) async {
    final PaginatedMovieListModel paginatedMovieList = await _repository.getAll(page);

    _movieList.addAll(paginatedMovieList.movieList);
    _subject.sink.add(PaginatedMovieListModel(paginatedMovieList.pagination, _movieList));
  }

  dispose() {
    _subject?.close();
  }
}
