import 'package:cabaca/src/blocs/writer_detail_bloc.dart';
import 'package:cabaca/src/models/writer_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WriterDetailScreen extends StatelessWidget {
  WriterDetailScreen(this.id) {
    writerDetailBloc.getWriterDetail(id);
  }

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Writer'),
      ),
      body: StreamBuilder(
          stream: writerDetailBloc.observeWriter,
          builder: (context, AsyncSnapshot<WriterDetailModel> snapshot) {
            if (snapshot.hasData) {
              return Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    child: Image.network(
                      'https://cabaca.id:8443/api/v2/files/${snapshot.data.photoUrl}&api_key=32ded42cfffb77dee86a29f43d36a3641849d4b5904aade9a79e9aa6cd5b5948',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    child: Text('${snapshot.data.name}'),
                  ),
                  Container(
                    child: Text('${snapshot.data.desc}'),
                  ),
                ],
              ));
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
