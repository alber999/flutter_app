import 'package:flutter_app/bloc/models/paginated_movie_list_model.dart';
import 'package:flutter_app/bloc/resources/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final PaginatedMovieListModel _paginatedMovieList = PaginatedMovieListModel();
  final _repository = MovieRepository();
  final _subject = BehaviorSubject<PaginatedMovieListModel>();

  Observable<PaginatedMovieListModel> get all => _subject.stream;

  getAllFirstPage() async {
    _paginatedMovieList.movieList.clear();
    _sinkAll(await _repository.getAllFirstPage());
  }

  getAllNextPage() async {
    _sinkAll(await _repository.getAllNextPage(_paginatedMovieList.pagination));
  }

  _sinkAll(PaginatedMovieListModel data) {
    _paginatedMovieList.movieList.addAll(data.movieList);
    _paginatedMovieList.pagination = data.pagination;
    _subject.sink.add(_paginatedMovieList);
  }

  dispose() {
    _subject?.close();
  }
}
