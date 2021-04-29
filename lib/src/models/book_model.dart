
class BookModel {
  int _id;
  String _title;
  String _coverUrl;
  int _writerId;
  String _writerName;

  BookModel(result) {
    _id = result['id'];
    _title = result['title'];
    _coverUrl = result['cover_url'];
    _writerId = result['Writer_by_writer_id']['user_id'];
    _writerName = result['Writer_by_writer_id']['User_by_user_id']['name'];
  }

  String get writerName => _writerName;

  int get writerId => _writerId;

  String get coverUrl => _coverUrl;

  String get title => _title;

  int get id => _id;
}