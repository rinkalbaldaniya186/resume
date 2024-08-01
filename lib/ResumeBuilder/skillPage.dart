// import 'package:flutter/material.dart';
//
// class SkillPage extends StatefulWidget {
//   @override
//   _SkillPageState createState() => _SkillPageState();
// }
//
// class _SkillPageState extends State<SkillPage> {
//   List<String> _chipData = [
//     'Flutter',
//     'Dart',
//     'Android',
//     'iOS',
//     'Mobile Development',
//   ];
//
//   List<String> _selectedChips = [];
//
//   void _onChipSelected(String chip) {
//     setState(() {
//       if (_selectedChips.contains(chip)) {
//         _selectedChips.remove(chip);
//       } else {
//         _selectedChips.add(chip);
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chips Example'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Wrap(
//               spacing: 8.0,
//               children: _chipData.map((String chip) {
//                 return ChoiceChip(
//                   label: Text(chip),
//                   selected: _selectedChips.contains(chip),
//                   onSelected: (selected) {
//                     _onChipSelected(chip);
//                   },
//                   selectedColor: Colors.blue,
//                   labelStyle: TextStyle(color: Colors.black),
//                 );
//               }).toList(),
//             ),
//             SizedBox(height: 20.0),
//             Text('Selected Chips: ${_selectedChips.join(', ')}'),
//           ],
//         ),
//       ),
//     );
//   }
// }
///

import 'package:flutter/material.dart';
import 'package:rnewapp/ResumeBuilder/finalPage.dart';
import 'package:rnewapp/ResumeBuilder/model/project.dart';
import 'package:rnewapp/ResumeBuilder/model/skill.dart';

class SkillPage extends StatefulWidget {
  final List<Project> _submittedDataP;
  SkillPage(this._submittedDataP);

  @override
  _SkillPageState createState() => _SkillPageState(_submittedDataP);
}

class _SkillPageState extends State<SkillPage> {
  List<String> _chipData = [
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

  List<String> _selectedChips = [];

  List<Project> _submittedDataP;
  _SkillPageState(this._submittedDataP);

  void _onChipSelected(String chip) {
    setState(() {
      if (_selectedChips.contains(chip)) {
        _selectedChips.remove(chip);
      } else {
        _selectedChips.add(chip);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language and skill Detail'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: NetworkImage('https://img.freepik.com/premium-vector/hand-painted-watercolor-abstract-background_889452-17399.jpg'),
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 10.0,
                children: _chipData.map((String chip) {
                  return InputChip(
                    label: Text(chip),
                    backgroundColor: _selectedChips.contains(chip) ? Colors.blue.shade200 : Colors.grey.shade200,
                    labelStyle: TextStyle(color: Colors.black,fontSize: 15),
                    side: BorderSide(color: Colors.black, width: 1.5),
                    // deleteIcon: _selectedChips.contains(chip)
                    //     ? Icon(Icons.check)
                    //     : null, // Custom delete icon when selected
                    // onDeleted: () {
                    //   setState(() {
                    //     _chipData.remove(chip);
                    //     _selectedChips.remove(chip);
                    //   });
                    // },
                    onPressed: () {
                      _onChipSelected(chip);
                    },
                    elevation: 40,
                  );
                }).toList(),
              ),
              SizedBox(height: 20.0),
              Text('Selected Chips: ${_selectedChips.join(', ')}'),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 60,
                  width: 330,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FinalPage()));
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Flutter Chips Example'),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: <Widget>[
//               // Basic Chip with onTap
//               InkWell(
//                 onTap: () {
//                   Colors.blue;
//                 },
//                 child: Chip(
//                   label: Text('Basic Chip'),
//                 ),
//               ),
//               SizedBox(height: 10),
//
//               // Chip with Icon and onTap
//               InkWell(
//                 onTap: () {
//                   print('Chip with Icon tapped');
//                 },
//                 child: Chip(
//                   avatar: CircleAvatar(
//                     backgroundColor: Colors.blue.shade900,
//                     child: Text('AB'),
//                   ),
//                   label: Text('Chip with Icon'),
//                 ),
//               ),
//               SizedBox(height: 10),
//

//               // Chip with Delete Icon and onTap
//               InkWell(
//                 onTap: () {
//                   print('Chip with Delete Icon tapped');
//                 },
//                 child: Chip(
//                   label: Text('Chip with Delete Icon'),
//                   onDeleted: () {
//                     print('Delete icon pressed');
//                   },
//                   deleteIcon: Icon(Icons.cancel),
//                   deleteIconColor: Colors.red,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Choose Your Chips',
//       theme: ThemeData(
//         primarySwatch: Colors.yellow,
//       ),
//       home: ChipsChoice(),
//     );
//   }
// }
//
// class ChipsChoice extends StatefulWidget {
//   @override
//   _ChipsChoiceState createState() => _ChipsChoiceState();
// }
//
// class _ChipsChoiceState extends State<ChipsChoice> {
//   final List<String> chipTypes = ['English', 'Gujarati', 'Cheese', 'Sour Cream & Onion', 'Spicy'];
//   String? selectedChip;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Choose Your Chips'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               'Selected Chip: ${selectedChip ?? 'None'}',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: chipTypes.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(chipTypes[index]),
//                   leading: Radio<String>(
//                     value: chipTypes[index],
//                     groupValue: selectedChip,
//                     onChanged: (String? value) {
//                       setState(() {
//                         selectedChip = value;
//                       });
//                     },
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
//
// class Skill {
//   String name;
//
//   Skill(this.name);
// }
//
// class SkillPage extends StatefulWidget {
//   @override
//   _SkillPageState createState() => _SkillPageState();
// }
//
// class _SkillPageState extends State<SkillPage> {
//   final List<Skill> skills = [];
//   final TextEditingController _controller = TextEditingController();
//
//   void _addSkill(String skillName) {
//     setState(() {
//       skills.add(Skill(skillName));
//     });
//     _controller.clear();
//   }
//
//   void _removeSkill(Skill skill) {
//     setState(() {
//       skills.remove(skill);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             'Language & Skill Detail',
//             style: TextStyle(color: Colors.white, fontSize: 30),
//           ),
//           backgroundColor: Colors.blue.shade400,
//         ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               controller: _controller,
//               decoration: InputDecoration(
//                 labelText: 'Enter a skill',
//                 suffixIcon: IconButton(
//                   icon: Icon(Icons.add),
//                   onPressed: () {
//                     if (_controller.text.isNotEmpty) {
//                       _addSkill(_controller.text);
//                     }
//                   },
//                 ),
//               ),
//               onSubmitted: (value) {
//                 if (value.isNotEmpty) {
//                   _addSkill(value);
//                 }
//               },
//             ),
//             SizedBox(height: 20),
//             Wrap(
//               spacing: 8.0,
//               runSpacing: 4.0,
//               children: skills.map((skill) {
//                 return InputChip(
//                   label: Text(skill.name),
//                   onDeleted: () {
//                     _removeSkill(skill);
//                   },
//                 );
//               }).toList(),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//
//                 // Print all skills to console
//                 for (var skill in skills) {
//                   print(skill.name);
//                   List<String> allSkill = [];
//                   allSkill.add(skill.name);
//                   print('allSkill : ${allSkill}');
//                 }
//               },
//               child: Text('Add All Skills'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: SkillPage(),
//   ));
// }
