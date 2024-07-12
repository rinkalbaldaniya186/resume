import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rnewapp/ResumeBuilder/appHomePage.dart';
import 'package:rnewapp/ResumeBuilder/onboardingScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    Timer(Duration(seconds: 5), ()  async {
   //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnboardingScreen(),));
      var pref = await SharedPreferences.getInstance();
        bool isOnboarding = pref.getBool('isOnboarding') ?? false;
        if(isOnboarding){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AppHomePage(),));
        }
        else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnboardingScreen(),));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 500,
          width: 500,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/resume.png'),
              )
          ),
        ),
      ),
    );
  }
}