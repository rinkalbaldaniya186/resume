import 'package:flutter/material.dart';
import 'package:rnewapp/ResumeBuilder/educationalDetail.dart';
import 'package:rnewapp/ResumeBuilder/model/Users.dart';
import 'package:rnewapp/ResumeBuilder/rdbhelper.dart';

class FinalPage extends StatefulWidget {
  const FinalPage({super.key});

  @override
  State<FinalPage> createState() => _FinalPageState();
}

DbHelper _dbHelper = DbHelper();
List<Users> usersList = [];

void getListofUsers() async {
  print('i am called');
  usersList = (await _dbHelper.getUsersList())!;
  print(usersList.length);
}

class _FinalPageState extends State<FinalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Print Data'),
      ),
      body: ListView.builder(
        itemCount: usersList.length,
        itemBuilder: (context, index) {
        return ListTile(
          tileColor: Colors.blueGrey,
          title: Text("${usersList[index].firstName} ${usersList[index].middleName}"),
          subtitle: Text("${usersList[index].email}"),
         );
       },
      ),
    );
  }
}
