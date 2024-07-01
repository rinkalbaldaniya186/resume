import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Student {
  int id;
  String name;
  String course;

  Student({
    required this.id,
    required this.name,
    required this.course,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'course': course,
    };
  }

  @override
  String toString() {
    return 'Student{id: $id, name: $name, course: $course}';
  }
}

void Data() async {

  // WidgetsFlutterBinding.ensureInitialized();
  // final Database = openDatabase (
  //     join(await getDatabasesPath(), 'students_database.sd'),
  //     onCreate: (sd, version) {
  //       return sd.execute(
  //       'CREATE TABLE students(id INTEGER PRIMARY KEY, name TEXT, age INTEGER, course TEXT, fees INTEGER, discnt INTEGER, netfees INTEGER)',
  //       );
  //     },
  //     version: 1,
  // );
  //
  // Future<void> insertDog(Student student) async {
  // final sd = await Database;
  //
  //   await sd.insert(
  //     'students',
  //     student.toMap(),
  //     conflictAlgorithm: ConflictAlgorithm.replace
  //   );
  //   print('student :- ');
  //   print(student);
  // }
  //
  // var s1 = Student(id: 1, name: 'Rinkal',  course: 'Flutter');
  // Student s2 = Student(id: 2, name: 'Mitrusha', course: 'Full Stack Development');
  //
  // insertDog(s1);
  // insertDog(s2);
  // print('S1: $s1');
  // print('S2: $s2');

  // Future<List<Student>> Stud() async {
  // final sd = await Database;
  // final List<Map<String, Object?>> studentMap = await sd.query('students');
  //   return[
  //     for(final {
  //     'id': id as int,
  //     'name': name as String,
  //     'course': course as String,
  //
  //     } in studentMap)
  //  Student(id: id, name: name, course: course)
  // ];
  // }
  // print('Stud() :- ');
  // print(Stud());
  //
  // Future<void> apdateStud(Student student) async {
  // final sd = await Database;
  //
  //   await sd.update(
  //     'students',
  //     student.toMap(),
  //     where: 'id = ?',
  //     whereArgs: [student.id],
  //   );
  // }
  //
  // s1 = Student( //fido
  //   id: s1.id,
  //   name: s1.name,
  //   course: s1.course,
  // );
  //
  // await apdateStud(s1);
  // print('apdate fido :- ');
  // print(s1);
  //
  // Future<void> deleteStud(int id) async {
  // final sd = await Database;
  //
  //   await sd.delete(
  //     'students',
  //     where: 'id = ?',
  //     whereArgs: [1],
  //   );
  // }
  //
  // print('delete fido :- ');
  // print(deleteStud(1));
  
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        automaticallyImplyLeading: false,
      ),

      body: Center(
        child: Column(
          children: [
            ListTile(
              tileColor: Colors.purple.shade100,
              leading: CircleAvatar(
                backgroundColor: Colors.purple.shade50,
                child: Text('1'),
              ),
              title: Text('Rinkal'),
              subtitle: Text('Flutter Dev.'),
              trailing: PopupMenuButton(
                onSelected: (value) {

                },
                itemBuilder: (context) {
                   return [
                    PopupMenuItem(child: Text('Update'), value: 'Update'),
                    PopupMenuItem(child: Text('Delete'), value: 'Delete'),
                  ];
                },
              )
            ),
            ElevatedButton(
                onPressed: () async {
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

                  var s1 = Student(id: 1, name: 'Rinkal',  course: 'Flutter Development');
                  Student s2 = Student(id: 2, name: 'Mitrusha', course: 'Full Stack Development');

                  insertDog(s1);
                  insertDog(s2);
                  print('S1: $s1');
                  print('S2: $s2');

                },
                child: Text("Save Data")
            )
          ],
        ),
      )
    );
  }
}
