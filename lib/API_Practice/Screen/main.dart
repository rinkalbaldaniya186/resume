import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rnewapp/API_Practice/model/Data.dart';
import 'package:rnewapp/API_Practice/model/UserResponseP.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: ListScreen(),
    );
  }
}

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  List<Data> usersList = [];

  bool isLoading = true;

  @override
  void initState() {
    fetchUserList();
    super.initState();
  }

  void updateLoading(bool status){
    setState(() {
      isLoading = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Screen'),
      ),
      body:  isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
            itemCount: usersList.length,
            itemBuilder: (context, index) {
           return ListTile(
            leading: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey.shade400,
              backgroundImage: NetworkImage('${usersList[index].avatar}'),
            ),
            title: Text(
                '${usersList[index].firstName} ${usersList[index].lastName}'),
            subtitle: Text('${usersList[index].email}'),
          );
        },
      ),
    );
  }

  Future<void> fetchUserList() async {
    updateLoading(true);

    Response response =
        await get(Uri.parse('https://reqres.in/api/users?delay=3#'));

    if (response.statusCode == 200) {
      // success
      // print('Response : ${response.body}');
      UserResponseP res = UserResponseP.fromJson(jsonDecode(response.body));

      setState(() {
        updateLoading(false);
        usersList = res.usersList ?? [];
      });
    } else {
      // failed
      updateLoading(false);
    }
  }

}
