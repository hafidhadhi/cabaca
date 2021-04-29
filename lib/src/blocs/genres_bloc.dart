
import 'package:cabaca/src/models/genre_model.dart';
import 'package:cabaca/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class GenresBloc {
  final _repository = Repository();
  final _genresFetcher = PublishSubject<List<GenreModel>>();

  Observable<List<GenreModel>> get observeGenres => _genresFetcher.stream;

  getGenres() async {
    try {
      List<GenreModel> genres = await _repository.getGenres();
      _genresFetcher.sink.add(genres);
    } on Exception catch (e) {
      print(e);
      _genresFetcher.addError(e);
    }
  }

  dispose() {
    _genresFetcher.close();
  }
}

final genresBloc = GenresBloc();