// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:rnewapp/ResumeBuilder/educationalDetail.dart';
import 'package:rnewapp/ResumeBuilder/model/Users.dart';
import 'package:rnewapp/ResumeBuilder/rdbhelper.dart';

class PersonalDetail extends StatefulWidget {
  const PersonalDetail({super.key});

  @override
  State<PersonalDetail> createState() => _PersonalDetailState();
}

TextEditingController _firstNameController = TextEditingController();
TextEditingController _lastNameController = TextEditingController();
 TextEditingController _middleNameController = TextEditingController();
TextEditingController _dobController = TextEditingController();
TextEditingController _genderController = TextEditingController();
TextEditingController _mNumController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _addressController = TextEditingController();

final DbHelper _dbHelper = DbHelper();

Future<void> addUser(Users user, BuildContext context) async {
  try {
    var id = await _dbHelper.insert(user);
    if (id != -1) {
      print("user add successfully: ");
      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => EducationalDetail(),
      //     ));
    }
  } catch (e) {
    print(e.toString());
    print("error");
  }
}
var pFname = _firstNameController.text;
var pMname = _middleNameController.text;
var pLname= _lastNameController.text;
var pDob = _dobController.text;
var pGender = _genderController.text;
var pMnum = _mNumController.text;
var pEmail = _emailController.text;
var pAddress = _addressController.text;

class _PersonalDetailState extends State<PersonalDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Personal Detail',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: Colors.blue.shade400,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'First Name',
                labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
                prefixIcon: Icon(Icons.person, color: Colors.black, size: 30),
              ),
              controller: _firstNameController,
              keyboardType: TextInputType.text,
              cursorHeight: 35,
              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Middle Name',
                labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
                prefixIcon: Icon(Icons.person, color: Colors.black, size: 30),
              ),
              controller: _middleNameController,
              keyboardType: TextInputType.text,
              cursorHeight: 35,
              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Last Name',
                labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
                prefixIcon: Icon(Icons.person, color: Colors.black, size: 30),
              ),
              controller: _lastNameController,
              keyboardType: TextInputType.text,
              cursorHeight: 35,
              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Date of Birth',
                labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
                prefixIcon: Icon(Icons.date_range, color: Colors.black, size: 30),
              ),
              controller: _dobController,
              keyboardType: TextInputType.datetime,
              cursorHeight: 35,
              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Gender',
                labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
                prefixIcon: Icon(Icons.people, color: Colors.black, size: 30),
                suffix: PopupMenuButton(
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        child: Text('Male'),
                        onTap: () {
                          var gprint = 'Male';
                          _genderController.text = gprint;
                        //  print(gprint);
                        },
                      ),
                      PopupMenuItem(
                        child: Text('Female'),
                        onTap: () {
                          var gprint = 'Female';
                          _genderController.text = gprint;
                        //  print(gprint);
                        },
                      ),
                      PopupMenuItem(
                        child: Text('Other'),
                        onTap: () {
                          var gprint = 'Other';
                          _genderController.text = gprint;
                          //  print(gprint);
                        },
                      )
                    ];
                  },
                ),
              ),
              controller: _genderController,
              keyboardType: TextInputType.text,
              cursorHeight: 35,
              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Mobile Number',
                labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
                prefixIcon: Icon(Icons.phone, color: Colors.black, size: 30),
              ),
              controller: _mNumController,
              keyboardType: TextInputType.number,
              cursorHeight: 35,
              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Email Address',
                labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
                prefixIcon: Icon(Icons.email, color: Colors.black, size: 30),
              ),
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              cursorHeight: 35,
              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Current Address',
                labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
                prefixIcon: Icon(Icons.location_on_rounded, color: Colors.black, size: 30),
              ),
              controller: _addressController,
              keyboardType: TextInputType.streetAddress,
              cursorHeight: 35,
              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),

            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 22, left: 20, right: 20,bottom: 22),
            child: Container(
              color: Colors.lightBlue,
              height: 60,
              width: 330,
              child: TextButton(
                child: Text(
                  'add',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.bold
                  ),),
                onPressed: () async {
                  Users user = Users(
                      id: 1,
                      firstName: _firstNameController.text,
                      middleName: _middleNameController.text,
                      lastName: _lastNameController.text,
                      dob: _dobController.text,
                      gender: _genderController.text,
                      mobile: int.parse(_mNumController.text),
                      email: _emailController.text,
                      address: _addressController.text);

                  var fullName = pFname + ' ' + pMname + ' ' + pLname;
                  // print('First Name : $pFname');
                  // print('Middle Name : $pMname');
                  // print('Last Name : $pLname');
                  print('Full Name : $fullName');
                  print('Dob : $pDob');
                  print('Gender : $pGender');
                  print('Mobile Number : $pMnum');
                  print('Email Address : $pEmail');
                  print('Current Address : $pAddress');

                  addUser(user, context);

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EducationalDetail(),
                      )
                  );
                },
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       InkWell(
          //         child: Text(
          //           'Next',
          //           style: TextStyle(
          //               color: Colors.black,
          //               fontSize: 25,
          //               fontWeight: FontWeight.w700),
          //         ),
          //         onTap: () {
          // Navigator.pushReplacement(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => EducationalDetail(),
          //     ));
          //         },
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}

var _labelText;
var _hintText;
var _controller;
var _icon;
TextField textField(String labelText, String hintTxt, controller, icon) {
  return TextField(
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.black, width: 2),
      ),
      enabled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.black, width: 4),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.grey, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.black, width: 4),
      ),
      labelText: _labelText,
      labelStyle: TextStyle(
          color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),
      floatingLabelStyle: TextStyle(
          color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),
      floatingLabelAlignment: FloatingLabelAlignment.start,
      hintText: _hintText,
      hintStyle: TextStyle(
          color: Colors.grey.shade900,
          fontSize: 20,
          fontWeight: FontWeight.w400),
      errorStyle: TextStyle(
          color: Colors.red, fontSize: 20, fontWeight: FontWeight.w400),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),
      contentPadding: EdgeInsets.all(20),
      prefixIcon: _icon,
    ),
    controller: _controller,
  );
}
//  ListView(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
//             child: textField(
//               _labelText = 'First Name',
//               _hintText = 'Enter Your First Name',
//               _controller = _firstNameController,
//               _icon = Icon(Icons.person, color: Colors.black, size: 27),
//
//             ),
//           ),
//           // Padding(
//           //   padding: EdgeInsets.only(top: 22,left: 20,right: 20),
//           //   child: textField(
//           //     _labelText = 'Middle Name',
//           //     _hintText = 'Enter Your Middle Name',
//           //     _controller = _middleNameController,
//           //     _icon = Icon(Icons.person,color: Colors.black,size: 27),
//           //   ),
//           // ),
//           Padding(
//             padding: EdgeInsets.only(top: 22, left: 20, right: 20),
//             child: textField(
//               _labelText = 'Last Name',
//               _hintText = 'Enter Your Last Name',
//               _controller = _lastNameController,
//               _icon = Icon(Icons.person, color: Colors.black, size: 27),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(top: 22, left: 20, right: 20),
//             child: textField(
//               _labelText = 'Date of Birth',
//               _hintText = 'Enter Your Date of Birth',
//               _controller = _dobController,
//               _icon = Icon(Icons.date_range, color: Colors.black, size: 27),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(top: 22, left: 20, right: 20),
//             child: textField(
//               _labelText = 'Gender',
//               _hintText = 'Enter Your gender',
//               _controller = _genderController,
//               _icon = Icon(Icons.person_2_outlined, color: Colors.black, size: 27),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(top: 22, left: 20, right: 20),
//             child: textField(
//               _labelText = 'Mobile Number',
//               _hintText = 'Enter Your Mobile Number',
//               _controller = _mNumController,
//               _icon = Icon(Icons.numbers, color: Colors.black, size: 27),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(top: 22, left: 20, right: 20),
//             child: textField(
//               _labelText = 'Email Address',
//               _hintText = 'Enter Your Email Address',
//               _controller = _emailController,
//               _icon = Icon(Icons.email, color: Colors.black, size: 27),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(top: 22, left: 20, right: 20),
//             child: textField(
//               _labelText = 'Current Address',
//               _hintText = 'Enter Your Current Address Name',
//               _controller = _addressController,
//               _icon = Icon(Icons.location_on_rounded,
//                   color: Colors.black, size: 27),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
//             child: Container(
//               color: Colors.lightBlue,
//               height: 60,
//               width: 330,
//               child: TextButton(
//                 child: Text('add',
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 27,
//                       fontWeight: FontWeight.bold
//                   ),),
//                 onPressed: () async {
//                   Users user = Users(
//                       id: 1,
//                       firstName: _firstNameController.text,
//                       lastName: _lastNameController.text,
//                       dob: int.parse(_dobController.text),
//                       gender: _genderController.text,
//                       mobile: int.parse(_mNumController.text),
//                       email: _emailController.text,
//                       address: _addressController.text);
//                   addUser(user, context);
//                   // await _dbHelper.insert(user as Users);
//                   Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => EducationalDetail(),
//                       ));
//                 },
//               ),
//             ),
//           ),
//           // Padding(
//           //   padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
//           //   child: Row(
//           //     mainAxisAlignment: MainAxisAlignment.end,
//           //     children: [
//           //       InkWell(
//           //         child: Text(
//           //           'Next',
//           //           style: TextStyle(
//           //               color: Colors.black,
//           //               fontSize: 25,
//           //               fontWeight: FontWeight.w700),
//           //         ),
//           //         onTap: () {
//           // Navigator.pushReplacement(
//           //     context,
//           //     MaterialPageRoute(
//           //       builder: (context) => EducationalDetail(),
//           //     ));
//           //         },
//           //       )
//           //     ],
//           //   ),
//           // )
//         ],
//       ),