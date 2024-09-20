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
        title: Text('Animated Container Example',style: TextStyle(color: Colors.black, fontSize: 27),),
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
            height: loading ? 170 : 270,
            width: loading ? 270 : 170,
           // color: loading ? Colors.amber.shade100 : Colors.amber.shade300,
            alignment: loading ? Alignment.center : Alignment.topCenter,

            decoration: loading
                ? BoxDecoration(
              color: Colors.amber.shade100,
              border: Border.all(color: Colors.purple.shade500, width: 2)
            )
                : BoxDecoration(
                color: Colors.amber.shade300,
                border: Border.all(color: Colors.purple.shade900, width: 5)
            ) ,
            child: loading
                ? Text('Hello World',style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w400),)
                : Text('Wel-Come',style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),),
          ),
        ),
      ),
    );
  }
}
