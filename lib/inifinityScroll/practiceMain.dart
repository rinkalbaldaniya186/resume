import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scroll_HomePage()
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
  final _list = List.generate(20, (index) => index);
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(loadMore);
  }

  void loadMore() {
    if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
      setState(() {
        _currentPage++;
        _list.addAll(List.generate(20, (index) => 'Item ${index + 1 + _currentPage * 20}'));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: ListView.builder(
        controller: ScrollController(),
        itemCount: _list.length,
        itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item ${_list[index]}'),
        );
       },
      ),
    );
  }
}
