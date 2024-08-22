import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rnewapp/API/model/UserResponse.dart';
import 'model/User.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Http Get',
      home: UserListScreen(),
    );
  }
}

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<User> userList = [];

  bool isLoading = false;

  @override
  void initState() {
    fetchUserList();
    super.initState();
  }

  void updateLoading(bool status) {
    setState(() {
      isLoading = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey.shade400,
                    backgroundImage: NetworkImage('${userList[index].avatar}'),
                  ),
                  title: Text(
                      '${userList[index].firstName} ${userList[index].lastName}'),
                  subtitle: Text('${userList[index].email}'),
                );
              },
            ),
    );
  }

  Future<void> fetchUserList() async {
    updateLoading(true);

    Response response =
        await get(Uri.parse('https://reqres.in/api/users?page=2'));

    if (response.statusCode == 200) {
      // success
      // print('Response : ${response.body}');

      UserResponse res = UserResponse.fromJson(jsonDecode(response.body));

      setState(() {
        updateLoading(false);
        userList = res.userList ?? [];
      });
    } else {
      // failed
      updateLoading(false);
    }
  }
}
