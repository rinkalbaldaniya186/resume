import 'package:flutter/material.dart';
import 'package:rnewapp/Database/dbHelper.dart';
import 'package:rnewapp/Database/model/user.dart';
import 'package:rnewapp/Database/userScreen.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}
DbHelper _dbHelper = DbHelper();
List<User> userList = [];

void getListofUsers() async {
  userList = (await _dbHelper.getUserList())!;
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
            title: Text(userList[index].name,style: TextStyle(color: Colors.black,fontSize: 20),),
            subtitle: Text(userList[index].email,style: TextStyle(color: Colors.black,fontSize: 18),),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserScreen(),
              )) .then((value) => getListofUsers());
          //.then((value) => setState(() {}));
          //
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
/// refresh
// import 'package:flutter/material.dart';
// import 'package:rnewapp/Database/rdbhelper.dart';
// import 'package:rnewapp/Database/model/user.dart';
// import 'package:rnewapp/Database/userScreen.dart';
//
// class UserListScreen extends StatefulWidget {
//   const UserListScreen({Key? key}) : super(key: key);
//
//   @override
//   State<UserListScreen> createState() => _UserListScreenState();
// }
//
// class _UserListScreenState extends State<UserListScreen> {
//   DbHelper _dbHelper = DbHelper();
//   List<User> userList = [];
//
//   @override
//   void initState() {
//     super.initState();
//     getListofUsers(); // Call getListofUsers in initState to fetch initial data
//   }
//
//   Future<void> getListofUsers() async {
//     List<User>? users = await _dbHelper.getUserList();
//     if (users != null) {
//       setState(() {
//         userList = users;
//       });
//     }
//   }
//
//   Future<void> deletelist() async {
//     userList = (await _dbHelper.deleteUser(id))!;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User List'),
//       ),
//       body: userList.isEmpty
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//                itemCount: userList.length,
//                itemBuilder: (context, index) {
//             return ListTile(
//               title: Text(
//                 userList[index].name,
//                 style: TextStyle(color: Colors.black, fontSize: 20),
//               ),
//               subtitle: Text(
//                 userList[index].email,
//                 style: TextStyle(color: Colors.black, fontSize: 18),
//               ),
//               trailing: PopupMenuButton(
//                 onSelected: (value) {
//                   deletelist();
//                 },
//                 itemBuilder: (context) {
//                   return [
//                     PopupMenuItem(child: Text('Delete'),value: 'delete',)
//                   ];
//                 },
//               ),
//             );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => UserScreen()),
//           ).then((value) {
//             getListofUsers(); // Refresh the list after returning from UserScreen
//           });
//         },
//         child: Icon(
//           Icons.add,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }
/// delete
//import 'package:flutter/material.dart';
// import 'package:rnewapp/Database/rdbhelper.dart';
// import 'package:rnewapp/Database/model/user.dart';
// import 'package:rnewapp/Database/userScreen.dart';
//
// class UserListScreen extends StatefulWidget {
//   const UserListScreen({Key? key}) : super(key: key);
//
//   @override
//   State<UserListScreen> createState() => _UserListScreenState();
// }
//
// class _UserListScreenState extends State<UserListScreen> {
//   DbHelper _dbHelper = DbHelper();
//   List<User> userList = [];
//
//   @override
//   void initState() {
//     super.initState();
//     getListofUsers(); // Call getListofUsers in initState to fetch initial data
//   }
//
//   Future<void> getListofUsers() async {
//     List<User>? users = await _dbHelper.getUserList();
//     if (users != null) {
//       setState(() {
//         userList = users;
//       });
//     }
//   }
//
//   Future<void> deleteUser(int userId) async {
//     await _dbHelper.deleteUser(userId);
//     await getListofUsers(); // Refresh the list after deletion
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User List'),
//       ),
//       body: userList.isEmpty
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: userList.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(
//                     userList[index].name,
//                     style: TextStyle(color: Colors.black, fontSize: 20),
//                   ),
//                   subtitle: Text(
//                     userList[index].email,
//                     style: TextStyle(color: Colors.black, fontSize: 18),
//                   ),
//                   trailing: PopupMenuButton(
//                     onSelected: (value) {
//                       if (value == 'delete') {
//                         deleteUser(userList[index].id);
//                       }
//                     },
//                     itemBuilder: (context) {
//                       return [
//                         PopupMenuItem(
//                           child: Text('Delete'),
//                           value: 'delete',
//                         )
//                       ];
//                     },
//                   ),
//                 );
//               },
//             ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => UserScreen()),
//           ).then((value) {
//             getListofUsers(); // Refresh the list after returning from UserScreen
//           });
//         },
//         child: Icon(
//           Icons.add,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }