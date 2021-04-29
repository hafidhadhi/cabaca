
class WriterDetailModel {
  int _id;
  String _name;
  String _photoUrl;
  String _desc;

  WriterDetailModel(result) {
    _id = result['id'];
    _name = result['name'];
    _photoUrl = result['photo_url'];
    _desc = result['deskripsi'];
  }

  String get desc => _desc;

  String get photoUrl => _photoUrl;

  String get name => _name;

  int get id => _id;
}