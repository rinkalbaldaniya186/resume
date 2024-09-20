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
        title: Text('Animated Align Example',style: TextStyle(color: Colors.black, fontSize: 27),),
        backgroundColor: Colors.amber.shade400,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              loading = !loading;
            });
          },
          child: AnimatedContainer(
            duration: Duration(seconds: 2),
            height: 270,
            width: 270,
            // color: loading ? Colors.amber.shade100 : Colors.amber.shade300,
            alignment: loading ? Alignment.topRight : Alignment.bottomLeft,
            decoration: BoxDecoration(
                color: Colors.amber.shade100,
                border: Border.all(color: Colors.black, width: 3)
            ),
            child: FlutterLogo(
              size: 100
          ),
          ),
        ),
      ),
    );
  }
}
