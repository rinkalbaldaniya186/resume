import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

//import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as p ;

import 'model/allClass.dart';

class readypdf extends StatefulWidget {
  final Resume resume;
  late List ProjectDetails;
  late List experienceDetails;
  late List selectedChips;

  readypdf(this.resume, this.ProjectDetails, this.experienceDetails,
      this.selectedChips);

  @override
  State<readypdf> createState() => _readypdfState();
}

class _readypdfState extends State<readypdf> {

  List<Resume> usersList = [];
  @override
  Widget build(BuildContext context) {
    print('Data :- ${widget.resume.firstName}');
    print('Experience Length :- ${widget.experienceDetails.length}');
    print('Project Length :- ${widget.ProjectDetails[0].title}');
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                                Text('${widget.resume.gender}'),
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
                                Text('${widget.resume.mobileNum}')
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
                                Text('${widget.resume.email}'),
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
                                Text('${widget.resume.address}'),
                              ],
                            ),

                            SizedBox(height: 10),
                            Text('Skills Details', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),
                            Text('${widget.selectedChips}'),

                            SizedBox(height: 10),
                            Text('Experience Details', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),
                            SizedBox(height: 5),
                            Text('${widget.experienceDetails[0].title}'),
                            Text('Company: ${widget.experienceDetails[0].company}'),
                            Text('Duration: ${widget.experienceDetails[0].duration}'),
                            Text('Descripation: ${widget.experienceDetails[0].description} '),
                            SizedBox(height: 10),
                            Text('${widget.experienceDetails[1].title}'),
                            Text('Company: ${widget.experienceDetails[1].company}'),
                            Text('Duration: ${widget.experienceDetails[1].duration}'),
                            Text('Descripation: ${widget.experienceDetails[1].description} '),
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
                            Text('10th Detail', style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w400),),
                            Text('${widget.resume.sNameT}'),
                            Text('Complete in ${widget.resume.timeT}'),
                            Text('Result: ${widget.resume.perT} %'),
                            SizedBox(height: 10),
                            Text('12th Detail', style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w400),),
                            Text('${widget.resume.sNameTw}'),
                            Text('Stream: ${widget.resume.streamTw}'),
                            Text('Complete in ${widget.resume.timeTw}'),
                            Text('Result: ${widget.resume.perTw} %'),
                            SizedBox(height: 10),
                            Text('More Detail', style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w400),),
                            Text('${widget.resume.sNameGr}'),
                            Text('Stream: ${widget.resume.locationGr}'),
                            Text('Complete in ${widget.resume.timeGr}'),
                            Text('Result: ${widget.resume.resultGr} %'),
                            SizedBox(height: 10),
                            Text('More Detail', style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w400),),
                            Text('${widget.resume.sNameMo}'),
                            Text('Stream: ${widget.resume.locationMo}'),
                            Text('Complete in ${widget.resume.timeMo}'),
                            Text('Result: ${widget.resume.resultMo} %'),

                            SizedBox(height: 10),
                            Text('Project Details', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),
                            SizedBox(height: 10),
                            Text('${widget.ProjectDetails[0].title}'),
                            Text('Company: ${widget.ProjectDetails[0].company}'),
                            Text('Duration: ${widget.ProjectDetails[0].typeofproject}'),
                            Text('Descripation: ${widget.ProjectDetails[0].description} '),

                            TextButton(
                                onPressed: () {
                                  makePdf();
                                },
                                child: Text('Create Pdf'),
                            ),

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
      ),
    );
  }

  Future<void> makePdf() async{

    final pdf = p.Document();
    pdf.addPage(
      p.Page(build: (context){
        return p.Column(
          children: [
            p.Text('Pdf')
          ],
        );
      })
    );

   Directory root = await getApplicationDocumentsDirectory();
   String path = '${root.path}/test.pdf';
   final file = File(path);
   await file.writeAsBytes(await pdf.save());
   print('Path : $path');

  }

}
