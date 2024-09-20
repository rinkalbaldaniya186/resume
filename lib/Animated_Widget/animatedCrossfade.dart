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

  bool shouldWelcomeUse = true;
  var hello = "Hello";
  var goodBye = "Good Bye";
  
  _updatePadding(bool value){
    setState(() {
      shouldWelcomeUse = !shouldWelcomeUse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Align Example',style: TextStyle(color: Colors.black, fontSize: 27),),
        backgroundColor: Colors.amber.shade400,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  shouldWelcomeUse = !shouldWelcomeUse;
                });
              },
              child: Container(
                color: Colors.lightBlue.shade100,
                height: 100,
                width: 250,
                child: AnimatedCrossFade(
                  crossFadeState: shouldWelcomeUse
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
                  duration: Duration(seconds: 1),
                  firstCurve: Curves.easeOut,
                  secondCurve: Curves.easeIn,
                  sizeCurve: Curves.bounceOut,
                  firstChild: Text(hello),
                  secondChild: Text(goodBye),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
