import 'package:flutter_app/bloc/models/paginated_movie_list_model.dart';
import 'package:flutter_app/bloc/resources/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final PaginatedMovieListModel _paginatedMovieList = PaginatedMovieListModel();
  final _repository = MovieRepository();
  final _subject = BehaviorSubject<PaginatedMovieListModel>();

  Observable<PaginatedMovieListModel> get all => _subject.stream;

  getAllNextPage() async {
    final PaginatedMovieListModel data = await _repository.getAllNextPage(_paginatedMovieList.pagination);

    _paginatedMovieList.movieList.addAll(data.movieList);
    _paginatedMovieList.pagination = data.pagination;
    _subject.sink.add(_paginatedMovieList);
  }

  dispose() {
    _subject?.close();
  }
}
