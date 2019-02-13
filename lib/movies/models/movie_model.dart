class MovieModel {
  int _voteCount;
  int _id;
  bool _video;
  double _voteAverage;
  String _title;
  double _popularity;
  String _posterPath;
  String _originalLanguage;
  String _originalTitle;
  List<int> _genreIds = [];
  String _backdropPath;
  bool _adult;
  String _overview;
  String _releaseDate;

  MovieModel(dynamic data) {
    _voteCount = data['vote_count'];
    _id = data['id'];
    _video = data['video'];
    _voteAverage = data['vote_average'].toDouble();
    _title = data['title'];
    _popularity = data['popularity'].toDouble();
    _posterPath = data['poster_path'];
    _originalLanguage = data['original_language'];
    _originalTitle = data['original_title'];
    for (int i = 0; i < data['genre_ids'].length; i++) {
      _genreIds.add(data['genre_ids'][i]);
    }
    _backdropPath = data['backdrop_path'];
    _adult = data['adult'];
    _overview = data['overview'];
    _releaseDate = data['release_date'];
  }

  String get releaseDate => _releaseDate;

  String get overview => _overview;

  bool get adult => _adult;

  String get backdropPath => _backdropPath;

  List<int> get genreIds => _genreIds;

  String get originalTitle => _originalTitle;

  String get originalLanguage => _originalLanguage;

  String get posterPath => _posterPath;

  double get popularity => _popularity;

  String get title => _title;

  double get voteAverage => _voteAverage;

  bool get video => _video;

  int get id => _id;

  int get voteCount => _voteCount;
}
