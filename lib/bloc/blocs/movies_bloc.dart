import 'package:flutter_app/bloc/models/paginated_movie_list_model.dart';
import 'package:flutter_app/bloc/models/pagination_model.dart';
import 'package:flutter_app/bloc/resources/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final PaginatedMovieListModel _paginatedMovieList = PaginatedMovieListModel();
  final _repository = MovieRepository();
  final _subject = BehaviorSubject<PaginatedMovieListModel>();

  Observable<PaginatedMovieListModel> get all => _subject.stream;

  MoviesBloc reset() {
    _paginatedMovieList.movieList.clear();
    _paginatedMovieList.pagination = PaginationModel();
    return this;
  }

  getAllNextPage() async {
    final PaginatedMovieListModel data = await _repository.getAllNextPage(_paginatedMovieList.pagination);

    //uncomment to add delay to stream to be available
    //Future.delayed(const Duration(milliseconds: 1000), () {
    _paginatedMovieList.movieList.addAll(data.movieList);
    _paginatedMovieList.pagination = data.pagination;
    _subject.sink.add(_paginatedMovieList);
    //});
  }

  dispose() {
    _subject?.close();
  }
}
