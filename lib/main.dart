import 'package:cabaca/src/ui/book_detail_screen.dart';
import 'package:cabaca/src/ui/book_list_screen.dart';
import 'package:cabaca/src/ui/genre_list_screen.dart';
import 'package:cabaca/src/ui/home_screen.dart';
import 'package:cabaca/src/ui/writer_detail_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) {
        if (settings.name != '/') {
          var uri = Uri.parse(settings.name);

          if (uri.pathSegments.first == 'genres') {
            return MaterialPageRoute(builder: (context) => GenreListScreen());
          }

          if (uri.pathSegments.first == 'newbooks') {
            return MaterialPageRoute(
                builder: (context) => BookListScreen(
                      genreId: null,
                    ));
          }

          if (uri.pathSegments.length == 2 &&
              uri.pathSegments.first == 'category') {
            var id = uri.pathSegments[1];
            return MaterialPageRoute(
                builder: (context) => BookListScreen(
                      genreId: int.parse(id),
                      // title: (ModalRoute.of(context).settings.arguments)['title'])
                    ));
          }

          if (uri.pathSegments.length == 2 &&
              uri.pathSegments.first == 'book') {
            var id = uri.pathSegments[1];
            return MaterialPageRoute(
                builder: (context) => BookDetailScreen(
                      int.parse(id),
                    ));
          }

          if (uri.pathSegments.length == 2 &&
              uri.pathSegments.first == 'writer') {
            var id = uri.pathSegments[1];
            return MaterialPageRoute(
                builder: (context) => WriterDetailScreen(int.parse(id)));
          }
        }
        return MaterialPageRoute(builder: (context) => HomeScreen());
      },
      home: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}
