class PaginationModel {
  int _page;
  int _total_pages;
  int _total_results;

  PaginationModel([dynamic data]) {
    if (null != data) {
      _page = data['page'];
      _total_pages = data['total_pages'];
      _total_results = data['total_results'];
    }
  }

  int get page => _page;

  int get total_pages => _total_pages;

  int get total_results => _total_results;
}
