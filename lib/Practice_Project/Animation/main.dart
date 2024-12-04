import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _fontSize = 20;

  void increaseFontSize() {
    setState(() {
      _fontSize = 40;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('Flutter - tutorialkart.com')),
          ),
          body: ListView(children: <Widget>[
            Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  'Hello! Welcome to TutorialKart. We shall zoom this text when you long press on it.',
                  style: TextStyle(fontSize: _fontSize),
                )),
            ElevatedButton(
              onPressed: () => {increaseFontSize()},
              child: Text('Bigger Font'),
            )
           ]
          ),
        )
    );
  }
}