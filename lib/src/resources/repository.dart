
import 'package:cabaca/src/models/book_model.dart';
import 'package:cabaca/src/models/genre_model.dart';
import 'package:cabaca/src/models/writer_detail_model.dart';
import 'package:cabaca/src/resources/cabaca_service.dart';

class Repository {
  final cabacaService = CabacaService();

  Future<List<GenreModel>> getGenres() async => cabacaService.getGenres();
  Future<List<BookModel>> getBooksByGenre(int genreId) async => cabacaService.getBooksByGenres(genreId);
  Future<List<BookModel>> getNewBooks(int limit) async => cabacaService.getNewBooks(limit);
  Future<BookModel> getBookDetail(int bookId) async => cabacaService.getBookDetail(bookId);
  Future<WriterDetailModel> getWriterDetail(int id) async => cabacaService.getWriterDetail(id);
}