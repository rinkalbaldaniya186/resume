import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rnewapp/weather_API/screen/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
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
    Timer(Duration(seconds: 5), ()  async {
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://media.istockphoto.com/id/656116970/photo/blue-background.jpg?s=612x612&w=0&k=20&c=P7PWU0yK1Vc5y-0eexb96dCTSa7JS3fCKieY2G0dh9w="),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/weatherIcon.png"),
                fit: BoxFit.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

