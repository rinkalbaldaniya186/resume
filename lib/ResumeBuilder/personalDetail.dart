// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:rnewapp/ResumeBuilder/educationalDetail.dart';
import 'package:rnewapp/ResumeBuilder/model/Users.dart';

import 'model/allClass.dart';
// import 'package:rnewapp/ResumeBuilder/model/allClass.dart';
// import 'package:rnewapp/ResumeBuilder/rdbhelper.dart';

class PersonalDetail extends StatefulWidget {
  const PersonalDetail({super.key});

  @override
  State<PersonalDetail> createState() => _PersonalDetailState();
}

class _PersonalDetailState extends State<PersonalDetail> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _jobtitleController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _mNumController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

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
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: NetworkImage('https://img.freepik.com/premium-vector/hand-painted-watercolor-abstract-background_889452-17399.jpg'),
            )
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'First Name',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700),
                  prefixIcon: Icon(Icons.person, color: Colors.black, size: 30),
                ),
                controller: _firstNameController,
                keyboardType: TextInputType.text,
                cursorHeight: 35,
                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Middle Name',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700),
                  prefixIcon: Icon(Icons.person, color: Colors.black, size: 30),
                ),
                controller: _middleNameController,
                keyboardType: TextInputType.text,
                cursorHeight: 35,
                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700),
                  prefixIcon: Icon(Icons.person, color: Colors.black, size: 30),
                ),
                controller: _lastNameController,
                keyboardType: TextInputType.text,
                cursorHeight: 35,
                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Job Title',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700),
                  prefixIcon: Icon(Icons.person, color: Colors.black, size: 30),
                ),
                controller: _jobtitleController,
                keyboardType: TextInputType.text,
                cursorHeight: 35,
                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Date of Birth',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700),
                  prefixIcon: Icon(Icons.date_range, color: Colors.black, size: 30),
                ),
                controller: _dobController,
                keyboardType: TextInputType.datetime,
                cursorHeight: 35,
                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Gender',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700),
                  prefixIcon: Icon(Icons.people, color: Colors.black, size: 30),
                  suffix: PopupMenuButton(
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          child: Text('Male'),
                          onTap: () {
                            _genderController.text = 'Male';
                          },
                        ),
                        PopupMenuItem(
                          child: Text('Female'),
                          onTap: () {
                            _genderController.text = 'Female';
                          },
                        ),
                        PopupMenuItem(
                          child: Text('Other'),
                          onTap: () {
                            _genderController.text = 'Other';
                          },
                        )
                      ];
                    },
                  ),
                ),
                controller: _genderController,
                keyboardType: TextInputType.text,
                cursorHeight: 35,
                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700),
                  prefixIcon: Icon(Icons.phone, color: Colors.black, size: 30),
                ),
                controller: _mNumController,
                keyboardType: TextInputType.number,
                cursorHeight: 35,
                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700),
                  prefixIcon: Icon(Icons.email, color: Colors.black, size: 30),
                ),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                cursorHeight: 35,
                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Current Address',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700),
                  prefixIcon: Icon(Icons.location_on_rounded, color: Colors.black, size: 30),
                ),
                controller: _addressController,
                keyboardType: TextInputType.streetAddress,
                cursorHeight: 35,
                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 22, left: 20, right: 20, bottom: 22),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 60,
                width: 330,
                child: TextButton(
                  child: Text(
                    'Next',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                    onPressed: () {
                      try {
                        // Users users = Users(
                        //   id: 1, // Example ID, adjust as per your schema
                        //   firstName: _firstNameController.text,
                        //   middleName: _middleNameController.text,
                        //   lastName: _lastNameController.text,
                        //   jobTitle: _jobtitleController.text, // Ensure this matches the Users class
                        //   dob: _dobController.text,
                        //   gender: _genderController.text,
                        //   mobileNum: _mNumController.text.isEmpty ? '' : _mNumController.text,
                        //   email: _emailController.text,
                        //   address: _addressController.text,
                        // );
                        Resume resume = Resume.users(
                           1, // Example ID, adjust as per your schema
                          _firstNameController.text,
                          _middleNameController.text,
                          _lastNameController.text,
                          _jobtitleController.text, // Ensure this matches the Users class
                          _dobController.text,
                          _genderController.text,
                          _mNumController.text.isEmpty ? '' : _mNumController.text,
                          _emailController.text,
                          _addressController.text,
                        );

                        print('id : ${resume.id}');
                        print('firstName : ${resume.firstName}');
                        print('middleName : ${resume.middleName}');
                        print('lastName : ${resume.lastName}');
                        print('jobTitle : ${resume.jobTitle}');
                        print('dob : ${resume.dob}');
                        print('gender : ${resume.gender}');
                        print('mobileNum : ${resume.mobileNum}');
                        print('email : ${resume.email}');
                        print('address : ${resume.address}');
                        // Navigate to the next screen, passing the user object
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EducationalDetail(resume: resume)

                        ));
                      } catch (e) {
                        // Handle any errors here
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Error'),
                              content: Text('Please check your input.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
