import 'package:flutter/material.dart';
import 'package:rnewapp/Database/userScreen.dart';
import 'dbHelper.dart';
import 'model/user.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

DbHelper _dbHelper = DbHelper();
List<User> userList = [];

void getListofUsers() async {
  print('i am called');
  userList = (await _dbHelper.getUserList())!;
  print(userList.length);
}

Future<void> deleteUser(int id) async {
  await _dbHelper.delete(id);
  print('delete data');
}

class _UserListScreenState extends State<UserListScreen> {

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
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UserScreen.withData(userList[index]),)).then((value) => getListofUsers()).then((value) => setState(() {}));
              print('id : ${userList[index].id}');
            },
            title: Text(userList[index].name,style: TextStyle(color: Colors.black,fontSize: 20),),
            subtitle: Text('${userList[index].email}',style: TextStyle(color: Colors.black,fontSize: 18),),
            trailing: PopupMenuButton(
              onSelected: (value) {
                deleteUser(userList[index].id).then((value) => getListofUsers()).then((value) => setState(() {}));
              },
              itemBuilder: (context) {
                return [
                  PopupMenuItem(child: Text('Delete'),value: 'Delete',)
                ];
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserScreen(),
              )).then((value) => getListofUsers()).then((value) => setState(() {}));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}