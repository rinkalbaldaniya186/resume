class Student{
  static int id = 0;
  String name;
  String email;
  int age;

  Student({required this.name, required this.email, required this.age});

  Map<String, Object> toMap(){
    return {
      'id': id,
      'name': name,
      'email': email,
      'age': age,
    };
  }

}
