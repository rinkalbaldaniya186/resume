import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rnewapp/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    screenChange();
  }

void screenChange(){
  Timer(Duration(seconds: 3),
    () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
    },
  );
}
  
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('Splash Screen'),
        ),
      ),
    );
  }
}
