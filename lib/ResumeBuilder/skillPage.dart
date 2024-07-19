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

class SkillPage extends StatefulWidget {
  @override
  _SkillPageState createState() => _SkillPageState();
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