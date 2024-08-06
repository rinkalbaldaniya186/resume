import 'package:flutter/material.dart';

import 'model/allClass.dart';

class ready extends StatefulWidget {
  final Resume resume;
  late List ProjectDetails = [];
  late List experienceDetails = [];
  late List selectedChips = [];

  ready(this.resume, this.ProjectDetails, this.experienceDetails,
      this.selectedChips);

  @override
  State<ready> createState() => _readyState();
}

class _readyState extends State<ready> {


//  List<personaldetail> userList = [];

  // void getListofUsers() async {
  //   print('I am called');
  //   // List<personaldetail>? fetchedUsers = await _dbhelper.getPersonalList();
  //   //  if (fetchedUsers != null) {
  //   //    setState(() {
  //   //      userList = fetchedUsers;
  //   //    });
  //   //  }
  //   //  print(userList.length);
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   getListofUsers();
  // }
  ///
//
//   @override
//   Widget build(BuildContext context) {
//     print(widget.resume.firstName);
//     print(widget.resume.sNameT);
//     print(widget.experienceDetails.length);
//     print(widget.ProjectDetails.length);
//     print(widget.selectedChips.length);
//
//     return Scaffold(
//       body: Column(
//        mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           // Container(
//           //   height: 400,
//           //   width: 500,
//           //   child: userList.isEmpty
//           //       ? Center(child: Text('No users available'))
//           //       : ListView.builder(
//           //           itemCount: userList.length,
//           //           itemBuilder: (context, index) {
//           //             return ListTile(
//           //               leading: Text(
//           //                 userList[index].Name,
//           //                 style: TextStyle(fontSize: 50),
//           //               ),
//           //             );
//           //           },
//           //         ),
//           // ),
//           Text('$widget.resume.firstName'),
//
//         ],
//       ),
//     );
//   }
// }

  List<Resume> usersList = [];
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
                      Text('${widget.resume.middleName} ${widget.resume.firstName}', style: TextStyle(color: Colors.black, fontSize: 21, fontWeight: FontWeight.w500),),
                      Text('${widget.resume.jobTitle}', style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.w500),),
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
                                Text('${widget.resume.dob}'),
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
                          if (usersList.isNotEmpty) ...[
                            Text('10th Detail', style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w400),),
                            Text('${usersList[0].sNameT}'),
                            Text('Complete in ${usersList[0].timeT}'),
                            Text('Result: ${usersList[0].perT} %'),
                            SizedBox(height: 10),
                            Text('12th Detail', style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w400),),
                            Text('${usersList[0].sNameTw}'),
                            Text('Stream: ${usersList[0].streamTw}'),
                            Text('Complete in ${usersList[0].timeTw}'),
                            Text('Result: ${usersList[0].perTw} %'),
                            SizedBox(height: 10),
                            Text('More Detail', style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w400),),
                            Text('${usersList[0].sNameGr}'),
                            Text('Stream: ${usersList[0].locationGr}'),
                            Text('Complete in ${usersList[0].timeGr}'),
                            Text('Result: ${usersList[0].resultGr} %'),
                            SizedBox(height: 10),
                            Text('More Detail', style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w400),),
                            Text('${usersList[0].sNameMo}'),
                            Text('Stream: ${usersList[0].locationMo}'),
                            Text('Complete in ${usersList[0].timeMo}'),
                            Text('Result: ${usersList[0].resultMo} %'),
                          ],
                          SizedBox(height: 10),
                          Text('Experience Details', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),
                          SizedBox(height: 10),
                          if (usersList.isNotEmpty) ...[
                            Text('${usersList[0].title}'),
                            Text('Stream: ${usersList[0].company}'),
                            Text('Complete in ${usersList[0].duration}'),
                            Text('Result: ${usersList[0].description} '),
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
