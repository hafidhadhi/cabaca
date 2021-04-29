import 'package:cabaca/src/models/book_model.dart';
import 'package:cabaca/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class BookDetailBloc {
  final _repository = Repository();
  final _booksFetcher = PublishSubject<BookModel>();

  Observable<BookModel> get observeBooks => _booksFetcher.stream;

  getBookDetail(int bookId) async {
    try {
      BookModel book = await _repository.getBookDetail(bookId);
      _booksFetcher.sink.add(book);
    } on Exception catch (e) {
      print(e);
      _booksFetcher.addError(e);
    }
  }

  dispose() {
    _booksFetcher.close();
  }
}

final bookDetailBloc = BookDetailBloc();
