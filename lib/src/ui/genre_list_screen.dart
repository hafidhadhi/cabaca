import 'package:cabaca/src/blocs/genres_bloc.dart';
import 'package:cabaca/src/models/genre_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GenreListScreen extends StatelessWidget {
  GenreListScreen() {
    genresBloc.getGenres();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cabaca'),
      ),
      body: StreamBuilder(
        stream: genresBloc.observeGenres,
        builder: (context, AsyncSnapshot<List<GenreModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      child: Text('${snapshot.data[index].title}'),
                    ),
                    onTap: () {
                      final genreId = snapshot.data[index].id;
                      final title = snapshot.data[index].title;
                      Navigator.pushNamed(context, '/category/$genreId',
                          arguments: {'title': title});
                    },
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
