/// userId : 1
/// id : 1
/// title : "sunt aut facere repellat provident occaecati excepturi optio reprehenderit"
/// body : "quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto"

class Post {
  Post({
      int? userId,
      num? id,
      String? title, 
      String? body,}){
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
}

  Post.fromJson(Map<String, dynamic> json) {
    _userId = json['userId'] as int; // Directly cast to int
    _id = json['id'] as int; // Directly cast to int
    _title = json['title'] as String;
    _body = json['body'] as String;
  }

  int? _userId;
  num? _id;
  String? _title;
  String? _body;
Post copyWith({  int? userId,
  num? id,
  String? title,
  String? body,
}) => Post(  userId: userId ?? _userId,
  id: id ?? _id,
  title: title ?? _title,
  body: body ?? _body,
);
  int? get userId => _userId;
  num? get id => _id;
  String? get title => _title;
  String? get body => _body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['id'] = _id;
    map['title'] = _title;
    map['body'] = _body;
    return map;
  }

}