import 'package:flutter_app/bloc/models/paginated_movie_list_model.dart';
import 'package:flutter_app/bloc/resources/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final _repository = MovieRepository();
  final _subject = PublishSubject<PaginatedMovieListModel>();

  Observable<PaginatedMovieListModel> get stream => _subject.stream;

  getAll([int page = 1]) async {
    PaginatedMovieListModel movieList = await _repository.getAll(page);
    _subject.sink.add(movieList);
  }

  dispose() {
    _subject.close();
  }
}

final moviesBloc = MoviesBloc();
