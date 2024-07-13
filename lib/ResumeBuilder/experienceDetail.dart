import 'package:flutter/material.dart';

class ExperienceDetail extends StatefulWidget {
  const ExperienceDetail({super.key});

  @override
  State<ExperienceDetail> createState() => _ExperienceDetailState();
}
// var checkboxValue;
// bool fresherTF = true;
// bool experiencedTF = false;
// bool experiencedERR = false;

var genderValue;
bool poValue = false;

class _ExperienceDetailState extends State<ExperienceDetail> {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              SizedBox(
                width: 30,
              ),
              Text('Select Your Current Position',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w700)),
            ],
          ),
          // Row(
          //   children: <Widget>[
          //     Checkbox(
          //       value: fresherTF,
          //       activeColor: Colors.blue.shade700,
          //       checkColor: Colors.white,
          //       focusColor: Colors.black,
          //       onChanged: (value) {
          //         setState(() {
          //           fresherTF = value!;
          //           print(value);
          //         });
          //       },
          //     ),
          //     Text('Fresher',style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.w700)),
          //     SizedBox(
          //       width: 5,
          //     ),
          //     Checkbox(
          //       isError: experiencedERR,
          //       activeColor: Colors.blue.shade700,
          //       checkColor: Colors.white,
          //       focusColor: Colors.black,
          //        value: experiencedTF,
          //       onChanged: (value) {
          //         setState(() {
          //           experiencedTF = value!;
          //           print(value);
          //         });
          //       },
          //     ),
          //     Text('Experienced',style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.w700)),
          //   ],
          // ),
          InkWell(
            onTap: () {

            },
            child: Row(
              children: [
              //  Text('Gender'),
                Radio(
                  value: 'Fresher',
                  groupValue: genderValue,
                  onChanged: (value) {
                    setState(() {
                      print(value);
                      genderValue = value;

                    });
                  },
                ),
                Text('Fresher',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),),

                SizedBox(
                  width: 10,
                ),
                Radio(
                  value: 'Experienced',
                  groupValue: genderValue,
                  onChanged: (value) {
                    setState(() {
                      print(value);
                      genderValue = value;
                    });
                    if(genderValue == 'Experienced'){
                      Container(
                        height: 100,
                        width: 300,
                        color: Colors.blue,
                      );
                    }
                  },
                ),
                Text('Experienced',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
