import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
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

  final _scrollController = ScrollController();
  final _list = List.generate(20, (index) => 'Item ${index + 1}');
  int _currentPage = 1;

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Infinity Scroll Example'),
        backgroundColor: Colors.grey.shade300,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return Container(
            height: 0.4,
            color: Colors.black45,
          );
        },
        controller: _scrollController,
        itemCount: _list.length,
        itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('List ${_list[index]}', style: TextStyle(color: Colors.black, fontSize: 22),),
          // subtitle: Container(
          //   height: 50,
          //   width: double.infinity,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: NetworkImage('https://png.pngitem.com/pimgs/s/612-6125667_blue-background-png-free-background-blue-background-hd.png'),
          //     )
          //   ),
          // ),
        );
       },
      ),
    );
  }
}
