// import 'package:flutter/material.dart';
//
// class PersonalDetailPage extends StatefulWidget {
//   const PersonalDetailPage({super.key});
//
//   @override
//   State<PersonalDetailPage> createState() => _PersonalDetailPageState();
// }
//
// TextEditingController _firstNameController = TextEditingController();
// TextEditingController _middleNameController = TextEditingController();
// TextEditingController _lastNameController = TextEditingController();
// TextEditingController _dobController = TextEditingController();
// TextEditingController _genderController = TextEditingController();
// TextEditingController _moNumController = TextEditingController();
// TextEditingController _emailController = TextEditingController();
// TextEditingController _addressController = TextEditingController();
//
// class _PersonalDetailPageState extends State<PersonalDetailPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Personal Detail',style: TextStyle(color: Colors.black,fontSize: 25),),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 22,left: 20,right: 20),
//                   child: textField(
//                       _labelText = 'First Name',
//                       _hintText = 'Enter Your First Name',
//                       _controller = _firstNameController,
//                       _icon = Icon(Icons.person,color: Colors.black,size: 27),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 22,left: 20,right: 20),
//                   child: textField(
//                     _labelText = 'Middle Name',
//                     _hintText = 'Enter Your Middle Name',
//                     _controller = _middleNameController,
//                     _icon = Icon(Icons.person,color: Colors.black,size: 27),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 22,left: 20,right: 20),
//                   child: textField(
//                     _labelText = 'Last Name',
//                     _hintText = 'Enter Your Last Name',
//                     _controller = _lastNameController,
//                     _icon = Icon(Icons.person,color: Colors.black,size: 27),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 22,left: 20,right: 20),
//                   child: textField(
//                     _labelText = 'Date of Birth',
//                     _hintText = 'Enter Your Date of Birth',
//                     _controller = _dobController,
//                     _icon = Icon(Icons.date_range,color: Colors.black,size: 27),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 22,left: 20,right: 20),
//                   child: textField(
//                     _labelText = 'Gender',
//                     _hintText = 'Enter Your gender',
//                     _controller = _genderController,
//                     _icon = Icon(Icons.person_2_outlined,color: Colors.black,size: 27),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 22,left: 20,right: 20),
//                   child: textField(
//                     _labelText = 'Mobile Number',
//                     _hintText = 'Enter Your Mobile Number',
//                     _controller = _moNumController,
//                     _icon = Icon(Icons.numbers,color: Colors.black,size: 27),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 22,left: 20,right: 20),
//                   child: textField(
//                     _labelText = 'Email Address',
//                     _hintText = 'Enter Your Email Address',
//                     _controller = _emailController,
//                     _icon = Icon(Icons.person,color: Colors.black,size: 27),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 22,left: 20,right: 20),
//                   child: textField(
//                     _labelText = 'Last Name',
//                     _hintText = 'Enter Your Last Name',
//                     _controller = _addressController,
//                     _icon = Icon(Icons.person,color: Colors.black,size: 27),
//                   ),
//                 ),
//               ],
//             ),
//         ),
//       ),
//     );
//   }
// }
//
// var _labelText;
// var _hintText;
// var _controller;
// var _icon;
//
// TextField textField(String labelText, String hintTxt, controller, icon){
//
//   return  TextField(
//     decoration: InputDecoration(
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(15),
//         borderSide: BorderSide(color: Colors.black,width: 2),
//       ),
//       enabled: true,
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(15),
//         borderSide: BorderSide(color: Colors.black,width: 4),
//       ),
//       disabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(15),
//         borderSide: BorderSide(color: Colors.grey,width: 2),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(15),
//         borderSide: BorderSide(color: Colors.black,width: 4),
//       ),
//       labelText: _labelText,
//       labelStyle: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w500),
//       floatingLabelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w500),
//       floatingLabelAlignment: FloatingLabelAlignment.start,
//       hintText: _hintText,
//       hintStyle: TextStyle(color: Colors.grey.shade900,fontSize: 20,fontWeight: FontWeight.w400),
//       errorStyle: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.w400),
//       errorBorder: OutlineInputBorder(
//         borderSide: BorderSide(color: Colors.red,width: 2),
//       ),
//       contentPadding: EdgeInsets.all(20),
//       prefixIcon: _icon,
//     ),
//     controller: _controller,
//   );
// }
// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('experience detail add page')),
//         body: FormScreen(),
//       ),
//     );
//   }
// }
//
// class FormScreen extends StatefulWidget {
//   @override
//   _FormScreenState createState() => _FormScreenState();
// }
//
// class _FormScreenState extends State<FormScreen> {
//   bool _isFormfield = false;
//   TextEditingController _textFieldController = TextEditingController();
//   TextEditingController _textFieldController2 = TextEditingController();
//   TextEditingController _textFieldController3 = TextEditingController();
//   TextEditingController _textFieldController4 = TextEditingController();
//   List<String> _submittedData = [];
//
//   void _toggleForm() {
//     setState(() {
//       if (_isFormfield) {
//         _textFieldController.clear();
//         _textFieldController2.clear();
//         _textFieldController3.clear();
//         _textFieldController4.clear();
//       }
//       _isFormfield = !_isFormfield;
//     });
//   }
//
//   void _addData() {
//     if (_textFieldController.text.isNotEmpty && _textFieldController2.text.isNotEmpty && _textFieldController3.text.isNotEmpty && _textFieldController4.text.isNotEmpty) {
//       setState(() {
//         _submittedData.add(_textFieldController.text);
//         _textFieldController.clear();
//         _submittedData.add(_textFieldController2.text);
//         _textFieldController2.clear();
//         _submittedData.add(_textFieldController3.text);
//         _textFieldController3.clear();
//         _submittedData.add(_textFieldController4.text);
//         _textFieldController4.clear();
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           ElevatedButton(
//             onPressed: _toggleForm,
//             child: Text(_isFormfield ? 'Hide Form' : 'Show Form'),
//           ),
//           if (_isFormfield)
//             SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         labelText: 'Company Name',
//                         labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
//                         //    prefixIcon: Icon(Icons.person, color: Colors.black, size: 30),
//                       ),
//                       controller: _textFieldController,
//                       keyboardType: TextInputType.text,
//                       cursorHeight: 35,
//                       style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         labelText: 'Location',
//                         labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
//                         //    prefixIcon: Icon(Icons.person, color: Colors.black, size: 30),
//                       ),
//                       controller: _textFieldController2,
//                       keyboardType: TextInputType.text,
//                       cursorHeight: 35,
//                       style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         labelText: 'Start Date - End Date',
//                         labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
//                         //    prefixIcon: Icon(Icons.person, color: Colors.black, size: 30),
//                       ),
//                       controller: _textFieldController3,
//                       keyboardType: TextInputType.text,
//                       cursorHeight: 35,
//                       style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         labelText: 'Descripation',
//                         labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
//                         //    prefixIcon: Icon(Icons.person, color: Colors.black, size: 30),
//                       ),
//                       controller: _textFieldController4,
//                       keyboardType: TextInputType.text,
//                       cursorHeight: 35,
//                       style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: _addData,
//                     child: Text('Add'),
//                   ),
//                 ],
//               ),
//             ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _submittedData.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(_submittedData[index]),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class ExperienceDetail extends StatefulWidget {
  const ExperienceDetail({super.key});

  @override
  State<ExperienceDetail> createState() => _ExperienceDetailState();
}

bool _isExperienceSelected = false;
bool _isFresherSelected = false;

class _ExperienceDetailState extends State<ExperienceDetail> {

  void _onExperienceChanged(bool? value){
    setState(() {
      _isExperienceSelected = value!;
      if (_isFresherSelected && _isExperienceSelected) {
        _isFresherSelected = false;
      }
    });
  }

  void _onFresherChanged(bool? value){
    setState(() {
      _isFresherSelected = value!;
      if (_isFresherSelected && _isExperienceSelected) {
        _isExperienceSelected = false;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add Experience Detail',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          backgroundColor: Colors.blue.shade400,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: _isExperienceSelected,
                    onChanged: _onExperienceChanged,
                  ),
                  const Text('Experience',style: TextStyle(color: Colors.black,fontSize: 25, fontWeight: FontWeight.w500),),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: _isFresherSelected,
                    onChanged: _onFresherChanged,
                  ),
                  const Text('Fresher',style: TextStyle(color: Colors.black,fontSize: 25, fontWeight: FontWeight.w500)),
                ],
              ),
              if(_isExperienceSelected)
                const Expanded(
                  child: ExperienceFieldForm(),
                ),
              if(_isFresherSelected)
                Center(
                  child: const Text('Welcome, Fresher!'),
                ),
            ],
          ),
        )
    );
  }
}

class ExperienceFieldForm extends StatefulWidget {
  const ExperienceFieldForm({super.key});

  @override
  State<ExperienceFieldForm> createState() => _ExperienceFieldFormState();
}

class _ExperienceFieldFormState extends State<ExperienceFieldForm> {
  bool _isFormVisible = false;
  final TextEditingController _textFieldController = TextEditingController();
  final TextEditingController _textFieldController2 = TextEditingController();
  final TextEditingController _textFieldController3 = TextEditingController();
  final TextEditingController _textFieldController4 = TextEditingController();
  final List<String> _submittedData = [];

  void _toggleForm() {
    setState(() {
      _isFormVisible = !_isFormVisible;
    });
  }

  void _addData() {
    if (_textFieldController.text.isNotEmpty && _textFieldController2.text.isNotEmpty && _textFieldController3.text.isNotEmpty && _textFieldController4.text.isNotEmpty) {
      setState(() {
        _submittedData.add('Company Name: ${_textFieldController.text}');
        _submittedData.add('Location: ${_textFieldController2.text}');
        _submittedData.add('Duration: ${_textFieldController3.text}');
        _submittedData.add('Description: ${_textFieldController4.text}');
        _textFieldController.clear();
        _textFieldController2.clear();
        _textFieldController3.clear();
        _textFieldController4.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            color: Colors.lightBlue,
            height: 60,
            width: 330,
            child: TextButton(
              onPressed: _toggleForm,
              child: Text(_isFormVisible ? 'Hide Form' : 'Show Form',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ),
        if (_isFormVisible)
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Company Name',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  controller: _textFieldController,
                  keyboardType: TextInputType.text,
                  cursorHeight: 35,
                  style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Location',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  controller: _textFieldController2,
                  keyboardType: TextInputType.text,
                  cursorHeight: 35,
                  style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Start Date - End Date',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  controller: _textFieldController3,
                  keyboardType: TextInputType.text,
                  cursorHeight: 35,
                  style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  controller: _textFieldController4,
                  keyboardType: TextInputType.text,
                  cursorHeight: 35,
                  style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              ElevatedButton(
                onPressed: _addData,
                child: const Text('Add'),
              ),
            ],
          ),
        Flexible(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return Container(
                height: 2,
                color: Colors.black,
              );
            },
            shrinkWrap: true,
            itemCount: _submittedData.length,
            itemBuilder: (context, index) {
              return ListTile(
                tileColor: Colors.grey.shade200,
                title: Text(_submittedData[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
