import 'package:flutter/material.dart';
import 'package:rnewapp/Database/dbHelper.dart';
import 'model/user.dart';

class UserScreen extends StatefulWidget {
  User? user;
  UserScreen({super.key});
  UserScreen.withData(this.user);

  @override
  State<UserScreen> createState() => _UserScreenState(user);
}

class _UserScreenState extends State<UserScreen> {
  User? user;
  _UserScreenState(this.user);

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _ageController = TextEditingController();

  DbHelper _dbHelper = DbHelper();

  Future<void> updateUser(User user1, BuildContext context) async {
    try{
      print('${user1.id} ${user1.name} ${user1.email}');
      var id = await _dbHelper.update(user1!);
      if(id!=-1){
        // success
        print('user updated successfully');
        Navigator.pop(context);
      }
    }catch(e){
      print('error updating data');
      print(e.toString());
    }

  }


  Future<void> addUser(User user, BuildContext context) async {
    try{
      var id = await _dbHelper.insert(user);
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
  void initState() {
    // TODO: implement initState
    super.initState();
    if(user!=null)
    {
      _nameController.text = user!.name;
      _emailController.text = user!.email;
      _ageController.text = (user!.age).toString();
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: (user != null) ? Text('Update User') : Text('Add User'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
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

                        if(user != null) {
                          User user1 = User.withID(id: user!.id, name: name, email: email, age: age);
                          updateUser(user1, context);
                        }
                        else {
                          User user1 = User(name: name, email: email, age: age);
                          addUser(user1, context);
                        }
                        //print('name : ${user.name}     email : ${user.email}    age : ${user.age}    date : ${user.date}    id : ${user.id}');
                      },
                      child: (user != null) ? Text('Update User') : Text('Add User'),
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