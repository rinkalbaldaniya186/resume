import 'package:flutter/material.dart';
import 'package:rnewapp/ResumeBuilder/experienceDetail.dart';
import 'package:rnewapp/ResumeBuilder/finalPage.dart';
import 'package:rnewapp/ResumeBuilder/rdbhelper.dart';
import 'model/education.dart';

class EducationalDetail extends StatefulWidget {
  const EducationalDetail({super.key});

  @override
  State<EducationalDetail> createState() => _EducationalDetailState();
}

bool controller = false;

 final DbHelper _dbHelper = DbHelper();

Future<void> addEdu(Education education, BuildContext context) async {
  try {
    var ide = await _dbHelper.insertEdu(education);
    if (ide != -1) {
      ide++;
      print("Education added successfully");
      print("Education Detail added successfully with ID: $ide");

      print('10th Detail :- ');
      print('$psNameT');
      print('$ptimeT');
      print('$pperT');

      print('12th Detail :- ');
      print('$psNameTw');
      print('$pStreamTw');
      print('$ptimeTw');
      print('$pperTw');

      print('Graduation Detail :- ');
      print('$psNameGr');
      print('$plocationGr');
      print('$ptimeGr');
      print('$pboeGr');

      print('More Detail :- ');
      print('$psNameMo');
      print('$plocationMo');
      print('$ptimeMo');
      print('$pperMo');

      // Navigate to next screen or perform any additional action
    } else {
      print("Failed to add user");
    }
  } catch (e) {
    print("Error adding user: $e");
  }
}
bool showContainer1 = true;
bool showContainer2 = true;
bool showContainer3 = true;
bool showContainer4 = true;

TextEditingController _sNameTController = TextEditingController();
TextEditingController _timeTController = TextEditingController();
TextEditingController _perTController = TextEditingController();

TextEditingController _sNameTwController = TextEditingController();
TextEditingController _StreamTwController = TextEditingController();
TextEditingController _timeTwController = TextEditingController();
TextEditingController _perTwController = TextEditingController();

TextEditingController _GrsNameController = TextEditingController();
TextEditingController _GrsLocationController = TextEditingController();
TextEditingController _GrtimeController = TextEditingController();
TextEditingController _GrresultController = TextEditingController();

TextEditingController _MosNameController = TextEditingController();
TextEditingController _MosLocationController = TextEditingController();
TextEditingController _MotimeController = TextEditingController();
TextEditingController _MoresultController = TextEditingController();

var psNameT = _sNameTController.text;
var ptimeT = _timeTController.text;
var pperT = _perTController.text;

var psNameTw = _sNameTwController.text;
var pStreamTw = _StreamTwController.text;
var ptimeTw = _timeTwController.text;
var pperTw = _perTwController.text;

var psNameGr = _GrsNameController.text;
var plocationGr = _GrsLocationController.text;
var ptimeGr = _GrtimeController.text;
var pboeGr = _GrresultController.text;

var psNameMo = _MosNameController.text;
var plocationMo = _MosLocationController.text;
var ptimeMo = _MotimeController.text;
var pperMo = _MoresultController.text;


class _EducationalDetailState extends State<EducationalDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Educational Detail',style: TextStyle(color: Colors.white,fontSize: 30),),
        backgroundColor: Colors.blue.shade400,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.lightBlue,
                    height: 60,
                    width: 330,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        showContainer1 = !showContainer1;
                      });
                    },
                    child: Text('Add 10th Detail',
                      style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontWeight: FontWeight.bold
                          ),),
                    // icon: Icon(Icons.add),
                  ),
                ),
                if (showContainer1)
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 20, right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(color: Colors.black,width: 2)
                      ),
                      width: double.infinity,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'School Name',
                                labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
                                prefixIcon: Icon(Icons.school, color: Colors.black, size: 30),
                              ),
                               controller: _sNameTController,
                              keyboardType: TextInputType.text,
                              cursorHeight: 35,
                              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Passing Month/Year',
                                labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
                                prefixIcon: Icon(Icons.calendar_month, color: Colors.black, size: 30),
                              ),
                              controller: _timeTController,
                              keyboardType: TextInputType.text,
                              cursorHeight: 35,
                              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Percentage',
                                labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
                                prefixIcon: Icon(Icons.grade, color: Colors.black, size: 30),
                              ),
                              controller: _perTController,
                              keyboardType: TextInputType.text,
                              cursorHeight: 35,
                              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
        
                SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.lightBlue,
                  height: 60,
                  width: 330,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        showContainer2 = !showContainer2;
                      });
                    },
                    child: Text('Add 12th Detail',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.bold
                      ),),
                    // icon: Icon(Icons.add),
                  ),
                ),
                if (showContainer2)
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 20, right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(color: Colors.black,width: 2)
                      ),
                      width: double.infinity,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 20, left: 20, right: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'School Name',
                                labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
                                prefixIcon: Icon(Icons.school, color: Colors.black, size: 30),
                              ),
                              controller: _sNameTwController,
                              keyboardType: TextInputType.text,
                              cursorHeight: 35,
                              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Stream',
                                labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
                                prefixIcon: Icon(Icons.stream, color: Colors.black, size: 30),
                              ),
                               controller: _StreamTwController,
                              keyboardType: TextInputType.text,
                              cursorHeight: 35,
                              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Passing Month/Year',
                                labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
                                prefixIcon: Icon(Icons.calendar_month, color: Colors.black, size: 30),
                              ),
                              controller: _timeTwController,
                              keyboardType: TextInputType.text,
                              cursorHeight: 35,
                              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Percentage',
                                labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
                                prefixIcon: Icon(Icons.grade, color: Colors.black, size: 30),
                              ),
                              controller: _perTwController,
                              keyboardType: TextInputType.text,
                              cursorHeight: 35,
                              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.lightBlue,
                  height: 60,
                  width: 330,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        showContainer3 = !showContainer3;
                      });
                    },
                    child: Text('Add Graduation Detail',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.bold
                      ),),
                    // icon: Icon(Icons.add),
                  ),
                ),
                if (showContainer3)
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 20, right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(color: Colors.black,width: 2)
                      ),
                      width: double.infinity,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 25),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Collage/University Name',
                                labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
                                //   prefixIcon: Icon(Icons.person, color: Colors.black, size: 30),
                              ),
                               controller: _GrsNameController,
                              keyboardType: TextInputType.text,
                              cursorHeight: 35,
                              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Location',
                                labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
                                //    prefixIcon: Icon(Icons.person, color: Colors.black, size: 30),
                              ),
                               controller: _GrsLocationController,
                              keyboardType: TextInputType.text,
                              cursorHeight: 35,
                              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Passing Month/Year',
                                labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
                                //     prefixIcon: Icon(Icons.person, color: Colors.black, size: 30),
                              ),
                               controller: _GrtimeController

                              ,
                              keyboardType: TextInputType.text,
                              cursorHeight: 35,
                              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Percentage',
                                labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
                                //    prefixIcon: Icon(Icons.person, color: Colors.black, size: 30),
                              ),
                              controller: _GrresultController,
                              keyboardType: TextInputType.text,
                              cursorHeight: 35,
                              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
        
                SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.lightBlue,
                  height: 60,
                  width: 330,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        showContainer4 = !showContainer4;
                      });
                    },
                    child: Text('Add More Detail',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.bold
                      ),),
                    // icon: Icon(Icons.add),
                  ),
                ),
                if (showContainer4)
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 20, right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(color: Colors.black,width: 2)
                      ),
                      width: double.infinity,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 25),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Collage/University Name',
                                labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
                                //   prefixIcon: Icon(Icons.person, color: Colors.black, size: 30),
                              ),
                               controller: _MosNameController,
                              keyboardType: TextInputType.text,
                              cursorHeight: 35,
                              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Location',
                                labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
                                //    prefixIcon: Icon(Icons.person, color: Colors.black, size: 30),
                              ),
                               controller: _MosLocationController,
                              keyboardType: TextInputType.text,
                              cursorHeight: 35,
                              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Passing Month/Year',
                                labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
                                //     prefixIcon: Icon(Icons.person, color: Colors.black, size: 30),
                              ),
                               controller: _MotimeController,
                              keyboardType: TextInputType.text,
                              cursorHeight: 35,
                              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Percentage',
                                labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
                                //    prefixIcon: Icon(Icons.person, color: Colors.black, size: 30),
                              ),
                               controller: _MoresultController,
                              keyboardType: TextInputType.text,
                              cursorHeight: 35,
                              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
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
                        'Next',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 27,
                            fontWeight: FontWeight.bold
                        ),),
                      onPressed: () async {
                       //  Education education = Education(
                       //    ide: 1,
                       //    sNameT: _sNameTController.text,
                       //    timeT: _timeTController.text,
                       //    perT: int.parse(_perTController.text),
                       //
                       //    sNameTw: _sNameTwController.text,
                       //    streamTw: _StreamTwController.text,
                       //    timeTw: _timeTwController.text,
                       //    perTw: int.parse(_perTwController.text),
                       //
                       //    sNameGr: _GrsNameController.text,
                       //    locationGr: _GrsLocationController.text,
                       //    timeGr: _GrtimeController.text,
                       //    resultGr: int.parse(_GrresultController.text),
                       //
                       //    sNameMo: _MosNameController.text,
                       //    locationMo: _MosLocationController.text,
                       //    timeMo: _MotimeController.text,
                       //    resultMo: int.parse(_MoresultController.text),
                       //
                       //  );
                       //
                       // // await addUser(user, context);
                       //  await addEdu(education, context);

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ExperienceDetail(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
      )
    );
  }

}

// class TextFieldInput extends StatefulWidget {
//   const TextFieldInput({Key? key}) : super(key: key);
//   @override
//   _TextFieldInputState createState() => _TextFieldInputState();
// }
//
// class _TextFieldInputState extends State<TextFieldInput> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             height: 50,
//             width: double.infinity,
//             color: Colors.teal,
//             child: TextField(
//               decoration: InputDecoration(border: OutlineInputBorder()),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

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


// Future<String> _customDialoug(BuildContext context) async {
//     return await showDialog(
//       context: context,
//       builder: (context) {
//         return Dialog(
//           backgroundColor: Colors.white,
//           elevation: 20,
//           child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Padding(
//                      padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
//                       child: TextField(
//                         decoration: InputDecoration(
//                           labelText: 'School/Collage Name',
//                           labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
//                           prefixIcon: Icon(Icons.school, color: Colors.black, size: 30),
//                         ),
//                         controller: _sNameController,
//                         keyboardType: TextInputType.text,
//                         cursorHeight: 35,
//                         style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
//                       ),
//                     ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         labelText: 'Location',
//                         labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
//                         prefixIcon: Icon(Icons.location_on_rounded, color: Colors.black, size: 30),
//                       ),
//                       controller: _locationController,
//                       keyboardType: TextInputType.text,
//                       cursorHeight: 35,
//                       style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         labelText: 'Passing Month/Year',
//                         labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
//                         prefixIcon: Icon(Icons.date_range, color: Colors.black, size: 30),
//                       ),
//                       controller: _timeController,
//                       keyboardType: TextInputType.text,
//                       cursorHeight: 35,
//                       style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         labelText: 'Result/Grade',
//                         labelStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),
//                         prefixIcon: Icon(Icons.grade, color: Colors.black, size: 30),
//                       ),
//                       controller: _resultController,
//                       keyboardType: TextInputType.emailAddress,
//                       cursorHeight: 35,
//                       style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 22, left: 20, right: 20,bottom: 22),
//                     child: Container(
//                       height: 50,
//                       width: 300,
//                       color: Colors.blue,
//                       child: TextButton(
//                           onPressed: () {
//                             print('School/Collage Name : $pSname');
//                             print('Location : $pLocation');
//                             print('Passing Month/Year : $pTime');
//                             print('Result/Grade : $pResult');
//
//                             Navigator.pop(context);
//                           },
//                           child: Text('Add Detail',
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold
//                             ),
//                           )
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

// 4 padding
//  Padding(
//                 padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
//                 child: Container(
//                   color: Colors.lightBlue,
//                   height: 60,
//                   width: 330,
//                   child: TextButton(
//                       child: Text('Add 10th Detail',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 27,
//                             fontWeight: FontWeight.bold
//                         ),
//                       ),
//                       onPressed: ()  {
//                         TextFieldInput();
//                       }
//                     // Navigator.pushReplacement(
//                     //     context,
//                     //     MaterialPageRoute(
//                     //       builder: (context) => SkillPage(),
//                     //     )
//                     // )
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
//                 child: Container(
//                   color: Colors.lightBlue,
//                   height: 60,
//                   width: 330,
//                   child: TextButton(
//                     child: Text('Add 12th Detail',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 27,
//                           fontWeight: FontWeight.bold
//                       ),
//                     ),
//                     onPressed: () async {
//                       var detailAns = await _customDialoug(context);
//                       print(detailAns);
//                       child: Text('Custom Dialoug');
//
//                       // Navigator.pushReplacement(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //       builder: (context) => SkillPage(),
//                       //     )
//                       // );
//                     },
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
//                 child: Container(
//                   color: Colors.lightBlue,
//                   height: 60,
//                   width: 330,
//                   child: IconButton(
//                     icon: Icon(Icons.add),
//                     // child: Text('Add Graduation Detail',
//                     //   style: TextStyle(
//                     //       color: Colors.white,
//                     //       fontSize: 27,
//                     //       fontWeight: FontWeight.bold
//                     //   ),
//                     // ),
//                     onPressed: () async {
//                       setState(() {
//                         showContainer2 = !showContainer2;
//                       });
//                       if (showContainer2)
//                         Container(
//                           width: double.maxFinite,
//                           child: Column(
//                             children: [
//                               TextField(
//                                 decoration:
//                                 InputDecoration(labelText: 'Board of education'),
//                               ),
//                               TextField(
//                                 decoration: InputDecoration(labelText: 'school name'),
//                               ),
//                               TextField(
//                                 decoration: InputDecoration(labelText: 'Stream'),
//                               ),
//                               TextField(
//                                 decoration: InputDecoration(labelText: 'percentage'),
//                               ),
//                             ],
//                           ),
//                         );
//
//                       // Text(
//                       //   '12th',
//                       //   style: TextStyle(fontSize: 30),
//                       // ),
//                       // IconButton(
//                       // onPressed: () {
//                       // setState(() {
//                       // showContainer2 = !showContainer2;
//                       // });
//                       // },
//                       // icon: Icon(Icons.add),
//                       // ),
//                       // if (showContainer2)
//                       // Container(
//                       // width: double.maxFinite,
//                       // child: Column(
//                       // children: [
//                       // TextField(
//                       // decoration:
//                       // InputDecoration(labelText: 'Board of education'),
//                       // ),
//                       // TextField(
//                       // decoration: InputDecoration(labelText: 'school name'),
//                       // ),
//                       // TextField(
//                       // decoration: InputDecoration(labelText: 'Stream'),
//                       // ),
//                       // TextField(
//                       // decoration: InputDecoration(labelText: 'percentage'),
//                       // ),
//                       // ],
//                       // ),
//                       // ),
//
//                       // Navigator.pushReplacement(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //       builder: (context) => SkillPage(),
//                       //     )
//                       // );
//                     },
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
//                 child: Container(
//                   color: Colors.lightBlue,
//                   height: 60,
//                   width: 330,
//                   child: TextButton(
//                     child: Text('Add More Detail',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 27,
//                           fontWeight: FontWeight.bold
//                       ),
//                     ),
//                     onPressed: () async {
//                       var detailAns = await _customDialoug(context);
//                       print(detailAns);
//                       child: Text('Custom Dialoug');
//
//                       // Navigator.pushReplacement(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //       builder: (context) => SkillPage(),
//                       //     )
//                       // );
//                     },
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
//                 child: Container(
//                   color: Colors.lightBlue,
//                   height: 60,
//                   width: 330,
//                   child: TextButton(
//                     child: Text('Next',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 27,
//                           fontWeight: FontWeight.bold
//                       ),
//                     ),
//                     onPressed: () async {
//                       Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => SkillPage(),
//                           )
//                       );
//                     },
//                   ),
//                 ),
//               ),