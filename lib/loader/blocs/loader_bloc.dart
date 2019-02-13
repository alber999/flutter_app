import 'package:rxdart/rxdart.dart';

class LoaderBloc {
  final _subject = BehaviorSubject<bool>();

  Observable<bool> get isLoading => _subject.stream;

  start() async {
    _subject.sink.add(true);
  }

  stop() async {
    _subject.sink.add(false);
  }

  dispose() {
    _subject?.close();
  }
}
