import 'package:cabaca/src/blocs/books_bloc.dart';
import 'package:cabaca/src/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookListScreen extends StatelessWidget {
  BookListScreen({this.genreId, this.title}) {
    if (genreId != null)
      booksBloc.getBooksByGenre(genreId);
    else
      booksBloc.getNewBooks();
  }

  final int genreId;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cabaca'),
      ),
      body: StreamBuilder(
        stream: booksBloc.observeBooks,
        builder: (context, AsyncSnapshot<List<BookModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Column(
                            children: [
                              Container(
                                child: Image.network(
                                  'https://cabaca.id:8443/api/v2/files/${snapshot.data[index].coverUrl}&api_key=32ded42cfffb77dee86a29f43d36a3641849d4b5904aade9a79e9aa6cd5b5948',
                                  fit: BoxFit.fitHeight,
                                  height: 100,
                                ),
                              ),
                              Container(
                                child: Text(
                                    'Title: ${snapshot.data[index].title}'),
                              ),
                            ],
                          ),
                          onTap: () {
                            final bookId = snapshot.data[index].id;
                            final title = snapshot.data[index].title;
                            Navigator.pushNamed(context, '/book/$bookId',
                                arguments: {'title': title});
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            child: Text(
                                'Writer: ${snapshot.data[index].writerName}'),
                          ),
                          onTap: () {
                            final id = snapshot.data[index].writerId;
                            final title = snapshot.data[index].title;
                            Navigator.pushNamed(context, '/writer/$id',
                                arguments: {'title': title});
                          },
                        ),
                      ],
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
