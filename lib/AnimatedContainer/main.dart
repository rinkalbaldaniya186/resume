import 'dart:html';

import 'package:flutter/material.dart';
import 'package:rnewapp/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool loading = true;
  void Selected(bool status){
    setState(() {
      loading = !status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Container(
          height: loading ? 100 : 200,
          width: loading ? 200 : 100,
          color: loading ? Colors.amber.shade100 : Colors.amber.shade200,

          child: Text('Hello World'),
        ),
      ),
    );
  }
}
