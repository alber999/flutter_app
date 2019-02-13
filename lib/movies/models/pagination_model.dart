class PaginationModel {
  int _page;
  int _totalPages;
  int _totalResults;

  PaginationModel([dynamic data]) {
    if (null != data) {
      _page = data['page'];
      _totalPages = data['total_pages'];
      _totalResults = data['total_results'];
    }
  }

  int get page => _page;

  int get totalPages => _totalPages;

  int get totalResults => _totalResults;
}
