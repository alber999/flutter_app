import 'package:rxdart/rxdart.dart';

import '../models/paginated_movie_list_model.dart';
import '../resources/movie_repository.dart';

class MoviesBloc {
  final _repository = MovieRepository();
  final _subject = PublishSubject<PaginatedMovieListModel>();

  Observable<PaginatedMovieListModel> get stream => _subject.stream;

  getAll() async {
    PaginatedMovieListModel movieList = await _repository.getAll();
    _subject.sink.add(movieList);
  }

  dispose() {
    _subject.close();
  }
}

final moviesBloc = MoviesBloc();
