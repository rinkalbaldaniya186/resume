import 'package:flutter/material.dart';
import 'package:rnewapp/Database/userListScreen_practice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: StudentListScreenPractice(),
    );
  }
}

