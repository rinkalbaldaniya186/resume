import 'package:flutter/material.dart';
import 'package:rnewapp/ResumeBuilder/model/Users.dart';
import 'package:rnewapp/ResumeBuilder/model/education.dart';
import 'package:rnewapp/ResumeBuilder/rdbhelper.dart';

class FinalPage extends StatefulWidget {
  const FinalPage({super.key});

  @override
  State<FinalPage> createState() => _FinalPageState();
}

DbHelper _dbHelper = DbHelper();
List<Users> usersList = [];
List<Education> eduList= [];

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

class _FinalPageState extends State<FinalPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getListofUsers();
      getListofEdu();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.blue.shade200,
            height: 110,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('${usersList[0].firstName} ${usersList[0].middleName}        ',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
                  Text(usersList.isNotEmpty ? usersList[0].jobtitle : '',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w500),),
                //  Text('${eduList[index].resultMo}'),
                //   Text(usersList[0].dob),
                //   Text(usersList[0].gender),
                //   Text(usersList[0].address),
                ],
              ),
          ),
          Row(
            children: [
              Column(
                children: [
                  Container(
                    color: Colors.blue.shade300,
                    height: 780,
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Gender: ${usersList[0].gender}'),
                        Text('Date of Birth: ${usersList[0].dob}'),
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/image/calllpng.png'),
                                  )
                              ),
                            ),
                            Text('${usersList[0].mobile}')
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/image/emailLogo.png'),
                                )
                              ),
                            ),
                            Text('${usersList[0].email}')
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/image/location.png'),
                                  )
                              ),
                            ),
                            Text('${usersList[0].email}')
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Column( // experience detail
                children: [
                  Container(
                    color: Colors.blue.shade400,
                    height: 780,
                    width: 261,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text('Experience'),
                        Text('${eduList[0].sNameT}'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
// Container(
// color: Colors.blue.shade200,
// height: 150,
// width: double.infinity,
// child: ListView.builder(
// itemCount: usersList.length,
// itemBuilder: (context, index) {
// return Column(
// children: [
// Text('${usersList[0].firstName} ${usersList[0].middleName} ${usersList[0].lastName}'),
// //  Text('${eduList[index].resultMo}'),
// Text(usersList[0].dob),
// Text(usersList[0].gender),
// Text(usersList[0].address),
// ],
// );
// },
// ),
// ),
// ListTile(
// tileColor: Colors.grey.shade300,
// title: Text("${usersList[0].firstName} ${usersList[0].middleName} ${usersList[index].lastName}",style: TextStyle(color: Colors.black,fontSize: 22),),
// subtitle: Text("${usersList[index].email}",style: TextStyle(color: Colors.black,fontSize: 22),),
// );