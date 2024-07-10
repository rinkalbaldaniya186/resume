import 'package:flutter/material.dart';

class SkillPage extends StatefulWidget {
  const SkillPage({super.key});

  @override
  State<SkillPage> createState() => _SkillPageState();
}

var checkboxValue;
bool communicationTF = false;
bool skillsManagementTF = false;
bool skillsManagemenERR = false;

class _SkillPageState extends State<SkillPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Skills Detail',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: Colors.blue.shade400,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              SizedBox(
                width: 30,
              ),
              Text('Soft Skills',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w700)),
            ],
          ),
          Row(
            children: <Widget>[
              Checkbox(
                value: communicationTF,
                activeColor: Colors.blue.shade700,
                checkColor: Colors.white,
                focusColor: Colors.black,
                onChanged: (value) {
                  setState(() {
                    communicationTF = value!;
                    print(value);
                  });
                },
              ),
              Text('Communication',style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.w700)),
              SizedBox(
                width: 5,
              ),
              Checkbox(
                isError: skillsManagemenERR,
                activeColor: Colors.blue.shade700,
                checkColor: Colors.white,
                focusColor: Colors.black,
                value: skillsManagementTF,
                onChanged: (value) {
                  setState(() {
                    skillsManagementTF = value!;
                    print(value);
                  });
                },
              ),
              Text('Skills Management',style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.w700)),
            ],
          ),
        ],
      ),
    );
  }
}
