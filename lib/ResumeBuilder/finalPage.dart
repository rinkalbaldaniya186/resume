import 'package:flutter/material.dart';
import 'package:rnewapp/ResumeBuilder/model/Users.dart';
import 'package:rnewapp/ResumeBuilder/model/education.dart';
import 'package:rnewapp/ResumeBuilder/rdbhelper.dart';
import 'model/experience.dart';
import 'model/project.dart';

class FinalPage extends StatefulWidget {
  final List<Project> _submittedDataP;
  List<Experience> submittedDataE;
  Education education;
  Users users;
  FinalPage(this._submittedDataP, this.submittedDataE, this.education, this.users);

  @override
  State<FinalPage> createState() => _FinalPageState(_submittedDataP, submittedDataE, education, users);
}

DbHelper _dbHelper = DbHelper();
List<Users> usersList = [];
List<Education> eduList = [];
List<Experience> exList = [];

void getListofUsers() async {
  print('i am called users');
  usersList = (await _dbHelper.getUsersList())!;
  print(usersList.length);
}

void getListofEdu() async {
  print('i am called education');
  eduList = (await _dbHelper.getEduList())!;
  print(eduList.length);
}

void getListofEx() async {
  print('i am called experience');
  exList = (await _dbHelper.getExpList())!;
  print(exList.length);
}

class _FinalPageState extends State<FinalPage> {
  List<Project> _submittedDataP;
  List<Experience> submittedDataE;
  Education education;
  Users users;

  _FinalPageState(this._submittedDataP, this.submittedDataE, this.education, this.users);

  @override
  void initState() {
    super.initState();
    getListofUsers();
    getListofEdu();
    getListofEx();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.blue.shade50,
              height: 110,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage('assets/image/girl3.jpg')
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                        Text('${widget.users.middleName} ${widget.users.firstName}', style: TextStyle(color: Colors.black, fontSize: 21, fontWeight: FontWeight.w500),),
                      Text('${widget.users.jobTitle}', style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.w500),),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(12),
                      color: Colors.blue.shade100,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Personal Details', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),
                          SizedBox(height: 10),
                          if (usersList.isNotEmpty) ...[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 17,
                                  width: 17,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/image/genderLogo.png'),
                                      )
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text('${usersList[0].gender}'),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 17,
                                  width: 17,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/image/dobLogo.png'),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text('${widget.users.dob}'),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/image/callLogo.png'),
                                      )
                                  ),
                                ),
                                SizedBox(width: 13),
                                Text('${usersList[0].mobileNum}')
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/image/emailLogo.webp'),
                                      )
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text('${usersList[0].email}')
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/image/location.png'),
                                      )
                                  ),
                                ),
                                SizedBox(width: 12),
                                Text('${usersList[0].address}'),
                              ],
                            ),
                          ],
                          SizedBox(height: 10),
                          Text('Skills Details', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(12),
                      color: Colors.blue.shade200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Education Details', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),
                          SizedBox(height: 10),
                          if (eduList.isNotEmpty) ...[
                            Text('10th Detail', style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w400),),
                            Text('${eduList[0].sNameT}'),
                            Text('Complete in ${eduList[0].timeT}'),
                            Text('Result: ${eduList[0].perT} %'),
                            SizedBox(height: 10),
                            Text('12th Detail', style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w400),),
                            Text('${eduList[0].sNameTw}'),
                            Text('Stream: ${eduList[0].streamTw}'),
                            Text('Complete in ${eduList[0].timeTw}'),
                            Text('Result: ${eduList[0].perTw} %'),
                            SizedBox(height: 10),
                            Text('More Detail', style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w400),),
                            Text('${eduList[0].sNameGr}'),
                            Text('Stream: ${eduList[0].locationGr}'),
                            Text('Complete in ${eduList[0].timeGr}'),
                            Text('Result: ${eduList[0].resultGr} %'),
                            SizedBox(height: 10),
                            Text('More Detail', style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w400),),
                            Text('${eduList[0].sNameMo}'),
                            Text('Stream: ${eduList[0].locationMo}'),
                            Text('Complete in ${eduList[0].timeMo}'),
                            Text('Result: ${eduList[0].resultMo} %'),
                          ],
                          SizedBox(height: 10),
                          Text('Experience Details', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),
                          SizedBox(height: 10),
                          if (exList.isNotEmpty) ...[
                            Text('${exList[0].title}'),
                            Text('Stream: ${exList[0].company}'),
                            Text('Complete in ${exList[0].duration}'),
                            Text('Result: ${exList[0].description} '),
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
