import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../model/Post.dart';

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
  //Post? posts;
  List<Post> listofPost = [];
  List<Post> res = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchUserList();
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
            itemCount: listofPost.length,
            itemBuilder: (context, index) {
            // final post = Posts![index];
            return ListTile(
              leading: CircleAvatar(
                // foregroundColor: Colors.black,
                radius: 40,
                backgroundColor: Colors.grey.shade400,
                child: Text('${listofPost[index].id}',style: TextStyle(color: Colors.black, fontSize: 25),),
              ),
              title: Text('${listofPost[index].title}',style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),
              subtitle: Text('${listofPost[index].body}',style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w400),),
            );
        },
      ),
    );
  }

  Future<void> fetchUserList() async {
    updateLoading(true);

    Response response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      setState(() {
        listofPost = data.map((json) => Post.fromJson(json)).toList();
         updateLoading(false);
      });
    } else {
      updateLoading(false);
      // Handle error
    }
  }
}


//   Future<void> fetchUserList() async {
//     updateLoading(true);
// 
//     Response response =
//     await get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
// 
//     if (response.statusCode == 200) {
// 
//       final List<dynamic> data = jsonDecode(response.body);
// 
//       setState(() {
//         posts = data.map((json) => Post.fromJson(json)).toList();
//         updateLoading(false);
//       });
//     } else {
//       // Handle error
//       updateLoading(false);
//     }
//   }