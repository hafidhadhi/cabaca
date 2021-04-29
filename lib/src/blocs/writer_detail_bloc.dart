
import 'package:cabaca/src/models/writer_detail_model.dart';
import 'package:cabaca/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class WriterDetailBloc {
  final _repository = Repository();
  final _writerFetcher = PublishSubject<WriterDetailModel>();

  Observable<WriterDetailModel> get observeWriter => _writerFetcher.stream;

  getWriterDetail(int id) async {
    try {
      WriterDetailModel writer = await _repository.getWriterDetail(id);
      _writerFetcher.sink.add(writer);
    } on Exception catch (e) {
      print(e);
      _writerFetcher.addError(e);
    }
  }

  dispose() {
    _writerFetcher.close();
  }
}

final writerDetailBloc = WriterDetailBloc();