import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
         home: MyHomePage(),
     );
  }
}

class MyHomePage extends StatefulWidget {
  @override
     _MyHomePageState createState() => _MyHomePageState();
}

final _scrollController = ScrollController();
final _list = List.generate(20, (index) => 'Item ${index + 1}');
int _currentPage = 1;

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMore);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMore() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      setState(() {
        _currentPage++;
        _list.addAll(List.generate(20, (index) => 'Item ${index + 1 + _currentPage * 20}'));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('page load');
    return Scaffold(
      appBar: AppBar(
        title: Text('Infinite Scrolling Example'),
        backgroundColor: Colors.lightBlue.shade200,
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _list.length,
        itemBuilder: (BuildContext context, int index) {
          print('in listview');
          return ListTile(
            title: Text('List ${_list[index]}', style: TextStyle(color: Colors.black)),
          );
        },
      ),
    );
  }
}