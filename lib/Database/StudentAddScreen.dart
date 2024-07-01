import 'package:flutter/material.dart';
import 'package:rnewapp/Database/Dbhelper_practice.dart';
import 'package:rnewapp/Database/model/student.dart';

class StudentAddScreen extends StatefulWidget {
  const StudentAddScreen({super.key});

  @override
  State<StudentAddScreen> createState() => _StudentAddScreenState();
}

class _StudentAddScreenState extends State<StudentAddScreen> {

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _ageController = TextEditingController();

  DBhelperPractice _dBhelperPractice = DBhelperPractice();

  Future<void> addStudent(Student student, BuildContext context)async {
    try{
      var id = await _dBhelperPractice.insert(student);
      if(id!=-1){
        // success
        print('user added successfully');
        Navigator.pop(context);
      }
    }catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student'),
      ),
      body: Center(
        child: Padding(
         padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(hintText: 'Enter name'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(hintText: 'Enter email'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _ageController,
                decoration: InputDecoration(hintText: 'Enter age'),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        String name = _nameController.text.toString().trim();
                        String email = _emailController.text.toString().trim();
                        int age = int.parse(_ageController.text.toString().trim());

                       Student student = Student(name: name, email: email, age: age);
                       addStudent(student, context);

                        print('name : ${student.name}     email : ${student.email}    age : ${student.age} ');
                      },
                      child: Text('Add User'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
