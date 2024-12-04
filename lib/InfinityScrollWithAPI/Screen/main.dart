import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:rnewapp/InfinityScrollWithAPI/model/Posts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scroll_HomePage(),
    );
  }
}

class Scroll_HomePage extends StatefulWidget {
  const Scroll_HomePage({super.key});

  @override
  State<Scroll_HomePage> createState() => _Scroll_HomePageState();
}

class _Scroll_HomePageState extends State<Scroll_HomePage> {

  ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  List<Posts> listofPost = [];
  bool isLoading = false;

  bool hasMore = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMore);
    fetchUserList(_currentPage);
  }

  void updateLoading(bool status) {
    setState(() {
      isLoading = status;
    });
  }

  void _loadMore() {
    print(_currentPage);
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _currentPage++;
      fetchUserList(_currentPage);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infinity Scroll with API Example'),
        backgroundColor: Colors.grey.shade300,
      ),
      body: isLoading
          ? Center(
            child: CircularProgressIndicator(),
          )
          : ListView.builder(
            controller: _scrollController,
            itemCount: listofPost.length,
            itemBuilder: (context, index) {
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

  Future<void> fetchUserList(int page) async {
    print(page);
    updateLoading(true);

    Response response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/posts?_page=$page&_limit=10'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      setState(() {
        listofPost = data.map((json) => Posts.fromJson(json)).toList();
        updateLoading(false);
      });
    } else {
      updateLoading(false);
      // Handle error
    }
  }
}
