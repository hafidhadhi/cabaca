
class GenreModel {
  int _id;
  String _title;
  String _iconUrl;
  int _count;

  GenreModel(result) {
    _id = result['id'];
    _title = result['title'];
    _iconUrl = result['icon_url'];
    _count = result['count'];
  }

  int get id => _id;
  String get title => _title;
  String get iconUrl => _iconUrl;
  int get count => _count;
}