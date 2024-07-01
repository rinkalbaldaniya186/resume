class User {
  var id;
  String name;
  String email;
  int age;

  User({required this.name, required this.email, required this.age});


  User.withID({this.id, required this.name, required this.email, required this.age});

  Map<String, Object> toMap() {
    return {'name': name, 'email': email, 'age': age};
  }

  Map<String, Object> toMapID() {
    return {'id': id, 'name': name, 'email': email, 'age': age};
  }

}