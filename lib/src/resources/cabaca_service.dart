import 'dart:convert';

import 'package:cabaca/src/models/book_model.dart';
import 'package:cabaca/src/models/genre_model.dart';
import 'package:cabaca/src/models/writer_detail_model.dart';
import 'package:http/http.dart';

class CabacaService {
  Client client = Client();
  final _apiKey = '25e0bf00ab2fa7f03a9fa57035139e47ccb28c20658f6de907b8011347e369fb';

  Future<List<GenreModel>> getGenres() async {
    print('GetGenres');
    final res = await client.get(
        'https://cabaca.id:8443/api/v2/cabaca/_table/genre',
        headers: {
          'x-dreamfactory-api-key' : '$_apiKey'
        }
    );
    print(res.toString());
    if (res.statusCode == 200) {
      final jsonRes = json.decode(res.body);
      final List<GenreModel> genres = [];
      for (int i = 0; i < jsonRes['resource'].length; i++) {
        print('Genre: ${jsonRes['resource'][i]}');
        genres.add(GenreModel(jsonRes['resource'][i]));
      }
      return genres;
    } else {
      throw Exception('Failed to load from network: ${res.statusCode}');
    }
  }

  Future<List<BookModel>> getBooksByGenres(int genreId) async {
    print('GetBooksByGenre');
    final res = await client.get(
        'https://cabaca.id:8443/api/v2/book/category?id=$genreId',
        headers: {
          'x-dreamfactory-api-key' : '$_apiKey'
        }
    );
    print(res.toString());
    if (res.statusCode == 200) {
      final jsonRes = json.decode(res.body);
      final List<BookModel> books = [];
      for (int i = 0; i < jsonRes['result'].length; i++) {
        print('Book by Genre: ${jsonRes['result'][i]}');
        books.add(BookModel(jsonRes['result'][i]));
      }
      return books;
    } else {
      throw Exception('Failed to load from network: ${res.statusCode}');
    }
  }

  Future<List<BookModel>> getNewBooks(int limit) async {
    print('getNewBooks');
    final res = await client.get(
        'https://cabaca.id:8443/api/v2/book/uptodate?limit=$limit',
        headers: {
          'x-dreamfactory-api-key' : '$_apiKey'
        }
    );
    print(res.toString());
    if (res.statusCode == 200) {
      final jsonRes = json.decode(res.body);
      final List<BookModel> books = [];
      for (int i = 0; i < jsonRes['result'].length; i++) {
        print('NewBook: ${jsonRes['result'][i]}');
        books.add(BookModel(jsonRes['result'][i]));
      }
      return books;
    } else {
      throw Exception('Failed to load from network: ${res.statusCode}');
    }
  }

  Future<BookModel> getBookDetail(int bookId) async {
    print('GetBookDetail');
    final res = await client.get(
        'https://cabaca.id:8443/api/v2/book/detail/$bookId',
        headers: {
          'x-dreamfactory-api-key' : '$_apiKey'
        }
    );
    print(res.toString());
    if (res.statusCode == 200) {
      final jsonRes = json.decode(res.body);
      return BookModel(jsonRes['result']);
    } else {
      throw Exception('Failed to load from network: ${res.statusCode}');
    }
  }

  Future<WriterDetailModel> getWriterDetail(int id) async {
    print('GetWriterDetail');
    final res = await client.get(
        'https://cabaca.id:8443/api/v2/writer/detail/$id',
        headers: {
          'x-dreamfactory-api-key' : '$_apiKey'
        }
    );
    print(res.toString());
    if (res.statusCode == 200) {
      final jsonRes = json.decode(res.body);
      return WriterDetailModel(jsonRes['result']);
    } else {
      throw Exception('Failed to load from network: ${res.statusCode}');
    }
  }


}