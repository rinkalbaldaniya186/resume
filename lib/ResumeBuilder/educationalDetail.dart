import 'package:flutter/material.dart';
import 'package:rnewapp/ResumeBuilder/model/Users.dart';
import 'package:rnewapp/ResumeBuilder/rdbhelper.dart';
import 'package:rnewapp/ResumeBuilder/skillPage.dart';


class EducationalDetail extends StatefulWidget {
  const EducationalDetail({super.key});

  @override
  State<EducationalDetail> createState() => _EducationalDetailState();
}

TextEditingController _sNameController = TextEditingController();
TextEditingController _locationController = TextEditingController();
TextEditingController _timeController = TextEditingController();
TextEditingController _resultController = TextEditingController();

var pSname = _sNameController.text;
var pLocation = _locationController.text;
var pTime = _timeController.text;
var pResult = _resultController.text;

class _EducationalDetailState extends State<EducationalDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Educational Detail',style: TextStyle(color: Colors.white,fontSize: 30),),
        backgroundColor: Colors.blue.shade400,
      ),
      body: Center(
        child:Padding(
            padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
             child: Container(
               color: Colors.lightBlue,
               height: 60,
               width: 330,
               child: TextButton(
                 child: Text('add detail',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 27,
                       fontWeight: FontWeight.bold
                   ),
                 ),
                 onPressed: () async {
                     var detailAns = await _customDialoug(context);
                     print(detailAns);
                   child: Text('Custom Dialoug');
                   // Navigator.pushReplacement(
                   //     context,
                   //     MaterialPageRoute(
                   //       builder: (context) => SkillPage(),
                   //     )
                   // );
                 },
              ),
          ),
        ),
      )
    );
  }
}
//ListView(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
//             child: TextField(
//               decoration: InputDecoration(
//                 labelText: 'School Collage Name',
//                 labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
//                 prefixIcon: Icon(Icons.school, color: Colors.black, size: 30),
//               ),
//               controller: _sNameController,
//               keyboardType: TextInputType.text,
//               cursorHeight: 35,
//               style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
//             child: TextField(
//               decoration: InputDecoration(
//                 labelText: 'Location',
//                 labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
//                 prefixIcon: Icon(Icons.location_on_rounded, color: Colors.black, size: 30),
//               ),
//               controller: _locationController,
//               keyboardType: TextInputType.text,
//               cursorHeight: 35,
//               style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
//             child: TextField(
//               decoration: InputDecoration(
//                 labelText: 'Passing Month/Year',
//                 labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
//                 prefixIcon: Icon(Icons.date_range, color: Colors.black, size: 30),
//               ),
//               controller: _timeController,
//               keyboardType: TextInputType.text,
//               cursorHeight: 35,
//               style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
//             child: TextField(
//               decoration: InputDecoration(
//                 labelText: 'Result/Grade',
//                 labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
//                 prefixIcon: Icon(Icons.grade, color: Colors.black, size: 30),
//               ),
//               controller: _resultController,
//               keyboardType: TextInputType.emailAddress,
//               cursorHeight: 35,
//               style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
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
//                   Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => SkillPage(),
//                       ));
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),

Future<String> _customDialoug(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          elevation: 20,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                     padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'School/Collage Name',
                          labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
                          prefixIcon: Icon(Icons.school, color: Colors.black, size: 30),
                        ),
                        controller: _sNameController,
                        keyboardType: TextInputType.text,
                        cursorHeight: 35,
                        style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Location',
                        labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
                        prefixIcon: Icon(Icons.location_on_rounded, color: Colors.black, size: 30),
                      ),
                      controller: _locationController,
                      keyboardType: TextInputType.text,
                      cursorHeight: 35,
                      style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Passing Month/Year',
                        labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
                        prefixIcon: Icon(Icons.date_range, color: Colors.black, size: 30),
                      ),
                      controller: _timeController,
                      keyboardType: TextInputType.text,
                      cursorHeight: 35,
                      style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Result/Grade',
                        labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
                        prefixIcon: Icon(Icons.grade, color: Colors.black, size: 30),
                      ),
                      controller: _resultController,
                      keyboardType: TextInputType.emailAddress,
                      cursorHeight: 35,
                      style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22, left: 20, right: 20,bottom: 22),
                    child: Container(
                      height: 50,
                      width: 300,
                      color: Colors.blue,
                      child: TextButton(
                          onPressed: () {
                            print('School/Collage Name : $pSname');
                            print('Location : $pLocation');
                            print('Passing Month/Year : $pTime');
                            print('Result/Grade : $pResult');
                            Navigator.pop(context);
                          },
                          child: Text('Add Detail',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
