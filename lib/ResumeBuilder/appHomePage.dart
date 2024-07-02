// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rnewapp/ResumeBuilder/personalDetail.dart';
import 'package:rnewapp/ResumeBuilder/rdbhelper.dart';

class AppHomePage extends StatefulWidget {
  const AppHomePage({super.key});

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

final DbHelper _dbHelper = DbHelper();

class _AppHomePageState extends State<AppHomePage> {
  void _initializeDB() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _dbHelper.createDatabase();
  }

  @override
  void initState() {
    super.initState();
    _initializeDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'App Home Page',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: Colors.blue.shade400,
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
              children: [
                Container(
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/image/resumehome2.png'),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Create Your Resume',
                  style: TextStyle(
                      color: Colors.blue.shade400,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  height: 70,
                  width: 330,
                  color: Colors.blue,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PersonalDetail(),
                            ));
                      },
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 27,
                            fontWeight: FontWeight.bold
                        ),
                      )
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}