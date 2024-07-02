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
          'Add Personal Detail',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: Colors.blue.shade400,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text('Skills'),
              Checkbox(
                value: communicationTF,
                onChanged: (value) {
                  setState(() {
                    communicationTF = value!;
                    print(value);
                  });
                },
              ),
              Text('Communication'),
              SizedBox(
                width: 10,
              ),
              Checkbox(
                isError: skillsManagemenERR,
                activeColor: Colors.blue.shade700,
                checkColor: Colors.white,
                focusColor: Colors.pink,
                value: skillsManagementTF,
                onChanged: (value) {
                  setState(() {
                    skillsManagementTF = value!;
                    print(value);
                  });
                },
              ),
              Text('Skills Management'),
            ],
          ),
        ],
      ),
    );
  }
}
