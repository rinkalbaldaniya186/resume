import 'package:flutter/material.dart';
import 'package:rnewapp/Database/Dbhelper_practice.dart';
import 'package:rnewapp/Database/StudentAddScreen.dart';
import 'package:rnewapp/Database/model/student.dart';

class StudentListScreenPractice extends StatefulWidget {
  const StudentListScreenPractice({super.key});

  @override
  State<StudentListScreenPractice> createState() => _UserListScreenPracticeState();
}

DBhelperPractice _dBhelperPractice = DBhelperPractice();
List<Student> studentList = [];


class _UserListScreenPracticeState extends State<StudentListScreenPractice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student List'),
      ),
      body: ListView.builder(
          itemCount: studentList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text( studentList[index].name,
                style: TextStyle(color: Colors.black, fontSize: 20),),
            );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => StudentAddScreen(),));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
