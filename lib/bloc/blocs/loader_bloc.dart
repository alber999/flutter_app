import 'package:rxdart/rxdart.dart';

class LoaderBloc {
  final _subject = BehaviorSubject<bool>();

  Observable<bool> get load => _subject.stream;

  show() async {
    _subject.sink.add(true);
  }

  hide() async {
    _subject.sink.add(false);
  }

  dispose() {
    _subject?.close();
  }
}
