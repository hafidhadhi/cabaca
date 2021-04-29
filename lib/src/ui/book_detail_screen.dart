import 'package:cabaca/src/blocs/book_detail_bloc.dart';
import 'package:cabaca/src/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookDetailScreen extends StatelessWidget {

  BookDetailScreen(this.bookId) {
    bookDetailBloc.getBookDetail(bookId);
  }

  final int bookId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Detail'),
      ),
      body: StreamBuilder(
          stream: bookDetailBloc.observeBooks,
          builder: (context, AsyncSnapshot<BookModel> snapshot) {
            if (snapshot.hasData) {
              return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(8),
                        child: Image.network(
                          'https://cabaca.id:8443/api/v2/files/${snapshot.data.coverUrl}&api_key=32ded42cfffb77dee86a29f43d36a3641849d4b5904aade9a79e9aa6cd5b5948',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        child: Text('${snapshot.data.title}'),
                      ),
                      // Container(
                      //   child: Text('${snapshot.data.title}'),
                      // ),
                    ],
                  )
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
