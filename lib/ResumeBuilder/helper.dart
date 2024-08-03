// import 'package:flutter/material.dart';
//
// /// text field widget
// Widget _buildTextField(TextEditingController controller, String label, IconData icon, {TextInputType inputType = TextInputType.text, bool isGenderField = false}) {
//   return Padding(
//     padding: const EdgeInsets.only(top: 22),
//     child: TextField(
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700),
//         prefixIcon: Icon(icon, color: Colors.black, size: 30),
//         suffix: isGenderField ? _buildGenderPopupMenu() : null,
//       ),
//       controller: controller,
//       keyboardType: inputType,
//       cursorHeight: 35,
//       style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
//     ),
//   );
// }
// /// popup menu widget
// Widget _buildGenderPopupMenu() {
//   return PopupMenuButton<String>(
//     onSelected: (value) {
//       _genderController.text = value;
//     },
//     itemBuilder: (context) {
//       return ['Male', 'Female', 'Other'].map((String choice) {
//         return PopupMenuItem<String>(
//           value: choice,
//           child: Text(choice),
//         );
//       }).toList();
//     },
//   );
// }
//
// /// submit button widget
// Widget _buildSubmitButton(BuildContext context) {
//   return Container(
//     decoration: BoxDecoration(
//       color: Colors.lightBlue,
//       borderRadius: BorderRadius.circular(10),
//     ),
//     height: 60,
//     width: 330,
//     child: TextButton(
//       child: Text(
//         'Next',
//         style: TextStyle(color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold),
//       ),
//       onPressed: () {
//         try {
//           AllClass users = AllClass.users(
//             id: 1, // Example ID, adjust as per your schema
//             firstName: _firstNameController.text,
//             middleName: _middleNameController.text,
//             lastName: _lastNameController.text,
//             jobTitle: _jobtitleController.text,
//             dob: _dobController.text,
//             gender: _genderController.text,
//             mobileNum: _mNumController.text.isEmpty ? '' : _mNumController.text,
//             email: _emailController.text,
//             address: _addressController.text,
//           );
//
//           print('id : ${users.id}');
//           print('firstName : ${users.firstName}');
//           print('middleName : ${users.middleName}');
//           print('lastName : ${users.lastName}');
//           print('jobTitle : ${users.jobTitle}');
//           print('dob : ${users.dob}');
//           print('gender : ${users.gender}');
//           print('mobileNum : ${users.mobileNum}');
//           print('email : ${users.email}');
//           print('address : ${users.address}');
//           // Navigate to the next screen, passing the user object
//           Navigator.of(context).push(MaterialPageRoute(
//               builder: (context) => EducationalDetail(users)
//           ));
//         } catch (e) {
//           // Handle any errors here
//           showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 title: Text('Error'),
//                 content: Text('Please check your input.'),
//                 actions: <Widget>[
//                   TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: Text('OK'),
//                   ),
//                 ],
//               );
//             },
//           );
//         }
//       },
//     ),
//   );
// }

