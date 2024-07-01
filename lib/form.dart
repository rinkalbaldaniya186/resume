import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: SqliteExample(),
    );
  }
}

TextEditingController _idController = TextEditingController();
TextEditingController _nameController = TextEditingController();
TextEditingController _ageController = TextEditingController();
TextEditingController _courseController = TextEditingController();
TextEditingController _feesController = TextEditingController();
TextEditingController _discntController = TextEditingController();

class SqliteExample extends StatefulWidget {
  const SqliteExample({super.key});

  @override
  State<SqliteExample> createState() => _SqliteExampleState();
}

class _SqliteExampleState extends State<SqliteExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'ID No.',
                    labelText: 'Id'
                  ),
                  controller: _idController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Name',
                      labelText: 'Name'
                  ),
                  controller: _nameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Age',
                      labelText: 'Age'
                  ),
                  controller: _ageController
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Course',
                      labelText: 'Course'
                  ),
                  controller: _courseController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Fees',
                      labelText: 'Fees'
                  ),
                  controller: _feesController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Discount',
                      labelText: 'Discount'
                  ),
                  controller: _discntController,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  // print(fido);
                  WidgetsFlutterBinding.ensureInitialized();
                  final Database = openDatabase (
                    join(await getDatabasesPath(), 'students_database.sd'),
                    onCreate: (sd, version) {
                      return sd.execute(
                        'CREATE TABLE students(id INTEGER PRIMARY KEY, name TEXT, age INTEGER, course TEXT, fees INTEGER, discnt INTEGER, netfees INTEGER)',
                      );
                    },
                    version: 1,
                  );
                  Future<void> insertDog(Student student) async {
                    final sd = await Database;

                    await sd.insert(
                        'students',
                        student.toMap(),
                        conflictAlgorithm: ConflictAlgorithm.replace
                    );
                    print('student :- ');
                    print(student);
                  }

                  var fido = Student(id: int.parse(_idController.text), name: _nameController.text, age: int.parse(_ageController.text), course: _courseController.text, fees: int.parse(_feesController.text), discnt: int.parse(_discntController.text), netfees: (int.parse(_feesController.text) - int.parse(_discntController.text)));
                  insertDog(fido);

                  Future<List<Student>> Stud() async {
                    final sd = await Database;
                    final List<Map<String, Object?>> studentMap = await sd.query('students');
                    return[
                      for(final {
                      'id': id as int,
                      'name': name as String,
                      'age': age as int,
                      'course': course as String,
                      'fees': fees as int,
                      'discnt': discnt as int,
                      'netfees': netfees as int,
                      } in studentMap)
                        Student(id: id, name: name, age: age, course: course, fees: fees, discnt: discnt, netfees: netfees)
                    ];
                  }
                  print('Stud() :- ');
                  print(await Stud());

                  Future<void> apdateStud(Student student) async {
                    final sd = await Database;

                    await sd.update(
                      'students',
                      student.toMap(),
                      where: 'id = ?',
                      whereArgs: [student.id],
                    );
                  }

                  fido = Student(
                      id: fido.id,
                      name: fido.name,
                      age: fido.age+5,
                      course: fido.course,
                      fees: fido.fees,
                      discnt: fido.discnt,
                      netfees: fido.netfees,
                  );
                  await apdateStud(fido);
                  print('apdate fido :- ');
                  print(fido);

                  Future<void> deleteStud(int id) async {
                    final sd = await Database;

                    await sd.delete(
                        'students',
                      where: 'id = ?',
                      whereArgs: [1],
                    );
                  }
                  print('delete fido :- ');
                    print(fido);
                 // Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(),));

                },
                child: Text('Print Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Student {
  int id;
  String name;
  int age;
  String course;
  int fees;
  int discnt;
  int netfees;


  Student({
        required this.id, 
        required this.name, 
        required this.age, 
        required this.course, 
        required this.fees, 
        required this.discnt, 
        required this.netfees
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'course': course,
      'fees': fees,
      'discnt': discnt,
      'netfees': netfees,
    };
  }

  @override
  String toString() {
    return 'Student{id: $id, name: $name, age: $age, course: $course, fees: $fees, discnt: $discnt, netfees: $netfees}';
  }

}