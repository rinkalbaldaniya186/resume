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
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getListofUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.teal,
            height: 700,
            width: double.infinity,
            child: ListView.builder(
        itemCount: usersList.length,
        itemBuilder: (context, index) {
        return ListTile(
          tileColor: Colors.grey.shade300,
          title: Text("${usersList[index].firstName} ${usersList[index].middleName} ${usersList[index].lastName}",style: TextStyle(color: Colors.black,fontSize: 22),),
          subtitle: Text("${usersList[index].email}",style: TextStyle(color: Colors.black,fontSize: 22),),
         );
       },
      ),
          ),
        ],
      ),
    );
  }
}

