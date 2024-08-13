import 'package:flutter/material.dart';
import 'package:rnewapp/ResumeBuilder/ready.dart';

import 'finalPage.dart';
import 'model/allClass.dart';

class SkillPage extends StatefulWidget {
  final Resume resume;
  late List ProjectDetails = [];
  late List experienceDetails = [];

  SkillPage.fresher(this.resume, this.experienceDetails);

  SkillPage(this.resume, this.ProjectDetails, this.experienceDetails);

  @override
  _SkillPageState createState() => _SkillPageState();
}

class _SkillPageState extends State<SkillPage> {

  List<String> _skillchip = [
    'Communication',
    'Leadership',
    'Positivity',
    'Creativity',
    'Empathy',
    'Self-motivation',
    'Time management',
    'Active listening',
    'Problem solving',
    'Critical thinking',
    'Teamwork',
    'Skills management',
    'Technical skills',
    'Project management',
    'Computer skills',
  ];

  List<String> _itskill = [
    'JavaScript',
    'C',
    'C++',
    'Dart',
    'Flutter',
    'Python',
    'HTML',
    'CSS',
    'Java',
    'SQL',
    'NoSQL',

  ];

  List<String> selectedChips = [];

  void _onChipSelected(String chip) {
    setState(() {
      if (selectedChips.contains(chip)) {
        selectedChips.remove(chip);
        // Optionally, remove the skill from the database here
      } else {
        selectedChips.add(chip); // Add skill to selected list
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.resume.firstName);
    print(widget.resume.sNameT);
    print(widget.experienceDetails.length);
    print(widget.ProjectDetails.length);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text(
          'Skill Detail',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage('https://img.freepik.com/premium-vector/hand-painted-watercolor-abstract-background_889452-17399.jpg'),
            ),
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Basic skill',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Wrap(
                spacing: 12.0,
                children: _skillchip.map((chip) => _buildChip(chip)).toList(),
              ),
              SizedBox(height: 20.0),
              Text(
                'IT skill',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Wrap(
                spacing: 12.0,
                children: _itskill.map((chip) => _buildChip(chip)).toList(),
              ),
              SizedBox(height: 20.0),
              Text(
                'Selected Skills: ${selectedChips.join(", ")}',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ready(
                            widget.resume,
                            widget.ProjectDetails,
                            widget.experienceDetails,
                            selectedChips)), // Make sure 'Ready' is capitalized
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChip(String chipLabel) {
    return InputChip(
      label: Text(chipLabel),
      backgroundColor: selectedChips.contains(chipLabel)
          ? Colors.blue.shade200
          : Colors.grey.shade200,
      labelStyle: TextStyle(color: Colors.black, fontSize: 16),
      side: BorderSide(color: Colors.black, width: 1.5),
      onPressed: () => _onChipSelected(chipLabel),
    );
  }
}
