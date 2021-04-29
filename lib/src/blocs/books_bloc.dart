
import 'package:cabaca/src/models/book_model.dart';
import 'package:cabaca/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class BooksBloc {
  final _repository = Repository();
  final _booksFetcher = PublishSubject<List<BookModel>>();

  Observable<List<BookModel>> get observeBooks => _booksFetcher.stream;

  getBooksByGenre(int genreId) async {
    try {
      List<BookModel> books = await _repository.getBooksByGenre(genreId);
      _booksFetcher.sink.add(books);
    } on Exception catch (e) {
      print(e);
      _booksFetcher.addError(e);
    }
  }

  getNewBooks({int limit = 7}) async {
    try {
      List<BookModel> books = await _repository.getNewBooks(limit);
      _booksFetcher.sink.add(books);
    } on Exception catch (e) {
      print(e);
      _booksFetcher.addError(e);
    }
  }

  dispose() {
    _booksFetcher.close();
  }
}

final booksBloc = BooksBloc();