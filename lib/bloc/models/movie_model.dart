class MovieModel {
  int _vote_count;
  int _id;
  bool _video;
  var _vote_average;
  String _title;
  double _popularity;
  String _poster_path;
  String _original_language;
  String _original_title;
  List<int> _genre_ids = [];
  String _backdrop_path;
  bool _adult;
  String _overview;
  String _release_date;

  MovieModel(dynamic data) {
    _vote_count = data['vote_count'];
    _id = data['id'];
    _video = data['video'];
    _vote_average = data['vote_average'];
    _title = data['title'];
    _popularity = data['popularity'];
    _poster_path = data['poster_path'];
    _original_language = data['original_language'];
    _original_title = data['original_title'];
    for (int i = 0; i < data['genre_ids'].length; i++) {
      _genre_ids.add(data['genre_ids'][i]);
    }
    _backdrop_path = data['backdrop_path'];
    _adult = data['adult'];
    _overview = data['overview'];
    _release_date = data['release_date'];
  }

  String get release_date => _release_date;

  String get overview => _overview;

  bool get adult => _adult;

  String get backdrop_path => _backdrop_path;

  List<int> get genre_ids => _genre_ids;

  String get original_title => _original_title;

  String get original_language => _original_language;

  String get poster_path => _poster_path;

  double get popularity => _popularity;

  String get title => _title;

  double get vote_average => _vote_average;

  bool get video => _video;

  int get id => _id;

  int get vote_count => _vote_count;
}
