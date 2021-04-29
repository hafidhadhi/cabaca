import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cabaca'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Container(
                  height: 100,
                  child: Center(
                    child: Text('Genre'),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/genres');
                },
              ),
              GestureDetector(
                child: Container(
                  height: 100,
                  child: Center(
                    child: Text('New Books'),
                  ),                ),
                onTap: () {
                  Navigator.pushNamed(context, '/newbooks');
                },
              ),
            ],
          ),
        ));
  }
}
