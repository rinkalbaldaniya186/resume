import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Size Example',style: TextStyle(color: Colors.black, fontSize: 27),),
        backgroundColor: Colors.amber.shade400,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              loading = !loading;
            });
          },
          child: Container(
            // ColoredBox(
            // width: loading ? 120 : 170,
            // height: loading ? 120 : 170,
            color: Colors.lightBlueAccent.shade100,
            child: AnimatedSize(
              duration: Duration(seconds: 3),
              curve: Curves.easeInOut,
                child: SizedBox.square(
                  dimension: loading ? 250.0 : 120.0,
                  child: Center(
                    child: FlutterLogo(size: 75.0),
                ),
             ),
            ),
          ),
        ),
      ),
    );
  }
}
