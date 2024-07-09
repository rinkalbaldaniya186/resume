import 'package:flutter/material.dart';

class PersonalDetailPage extends StatefulWidget {
  const PersonalDetailPage({super.key});

  @override
  State<PersonalDetailPage> createState() => _PersonalDetailPageState();
}

TextEditingController _firstNameController = TextEditingController();
TextEditingController _middleNameController = TextEditingController();
TextEditingController _lastNameController = TextEditingController();
TextEditingController _dobController = TextEditingController();
TextEditingController _genderController = TextEditingController();
TextEditingController _moNumController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _addressController = TextEditingController();

class _PersonalDetailPageState extends State<PersonalDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Detail',style: TextStyle(color: Colors.black,fontSize: 25),),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 22,left: 20,right: 20),
                  child: textField(
                      _labelText = 'First Name',
                      _hintText = 'Enter Your First Name',
                      _controller = _firstNameController,
                      _icon = Icon(Icons.person,color: Colors.black,size: 27),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 22,left: 20,right: 20),
                  child: textField(
                    _labelText = 'Middle Name',
                    _hintText = 'Enter Your Middle Name',
                    _controller = _middleNameController,
                    _icon = Icon(Icons.person,color: Colors.black,size: 27),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 22,left: 20,right: 20),
                  child: textField(
                    _labelText = 'Last Name',
                    _hintText = 'Enter Your Last Name',
                    _controller = _lastNameController,
                    _icon = Icon(Icons.person,color: Colors.black,size: 27),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 22,left: 20,right: 20),
                  child: textField(
                    _labelText = 'Date of Birth',
                    _hintText = 'Enter Your Date of Birth',
                    _controller = _dobController,
                    _icon = Icon(Icons.date_range,color: Colors.black,size: 27),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 22,left: 20,right: 20),
                  child: textField(
                    _labelText = 'Gender',
                    _hintText = 'Enter Your gender',
                    _controller = _genderController,
                    _icon = Icon(Icons.person_2_outlined,color: Colors.black,size: 27),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 22,left: 20,right: 20),
                  child: textField(
                    _labelText = 'Mobile Number',
                    _hintText = 'Enter Your Mobile Number',
                    _controller = _moNumController,
                    _icon = Icon(Icons.numbers,color: Colors.black,size: 27),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 22,left: 20,right: 20),
                  child: textField(
                    _labelText = 'Email Address',
                    _hintText = 'Enter Your Email Address',
                    _controller = _emailController,
                    _icon = Icon(Icons.person,color: Colors.black,size: 27),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 22,left: 20,right: 20),
                  child: textField(
                    _labelText = 'Last Name',
                    _hintText = 'Enter Your Last Name',
                    _controller = _addressController,
                    _icon = Icon(Icons.person,color: Colors.black,size: 27),
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}

var _labelText;
var _hintText;
var _controller;
var _icon;

TextField textField(String labelText, String hintTxt, controller, icon){

  return  TextField(
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.black,width: 2),
      ),
      enabled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.black,width: 4),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.grey,width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.black,width: 4),
      ),
      labelText: _labelText,
      labelStyle: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w500),
      floatingLabelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w500),
      floatingLabelAlignment: FloatingLabelAlignment.start,
      hintText: _hintText,
      hintStyle: TextStyle(color: Colors.grey.shade900,fontSize: 20,fontWeight: FontWeight.w400),
      errorStyle: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.w400),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red,width: 2),
      ),
      contentPadding: EdgeInsets.all(20),
      prefixIcon: _icon,
    ),
    controller: _controller,
  );
}
