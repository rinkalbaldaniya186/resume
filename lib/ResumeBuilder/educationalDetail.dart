import 'package:flutter/material.dart';
import 'package:rnewapp/ResumeBuilder/skillPage.dart';

class EducationalDetail extends StatefulWidget {
  const EducationalDetail({super.key});

  @override
  State<EducationalDetail> createState() => _EducationalDetailState();
}

class _EducationalDetailState extends State<EducationalDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Educational Detail',style: TextStyle(color: Colors.white,fontSize: 30),),
        backgroundColor: Colors.blue.shade400,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'School/Collage name',
                labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Location',
                labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Passing Month/year',
                labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Result/Grade',
                labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
            child: Container(
              color: Colors.lightBlue,
              height: 60,
              width: 330,
              child: TextButton(
                child: Text('add',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.bold
                  ),),
                onPressed: () async {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SkillPage(),
                      ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
