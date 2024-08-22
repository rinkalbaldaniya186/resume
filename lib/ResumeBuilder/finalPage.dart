import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw ;
import 'model/allClass.dart';

// class readypdf extends StatefulWidget {
//   final Resume resume;
//   late List ProjectDetails;
//   late List experienceDetails;
//   late List selectedChips;
//
//   readypdf(this.resume, this.ProjectDetails, this.experienceDetails,
//       this.selectedChips);
//
//   @override
//   State<readypdf> createState() => _readypdfState();
// }
//
// class _readypdfState extends State<readypdf> {
//
//   List<Resume> usersList = [];
//   @override
//   Widget build(BuildContext context) {
//     print('Data :- ${widget.resume.firstName}');
//     print('Experience Length :- ${widget.experienceDetails.length}');
//     print('Project Length :- ${widget.ProjectDetails[0].title}');
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Column(
//             children: [
//               Container(
//                 color: Colors.blue.shade50,
//                 height: 110,
//                 width: double.infinity,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     CircleAvatar(
//                         radius: 45,
//                         backgroundImage: AssetImage('assets/image/girl3.jpg')
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Text('${widget.resume.middleName} ${widget.resume.firstName}', style: TextStyle(color: Colors.black, fontSize: 21, fontWeight: FontWeight.w500),),
//                         Text('${widget.resume.jobTitle}', style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.w500),),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     Expanded(
//                       child: Container(
//                         padding: EdgeInsets.all(12),
//                         color: Colors.blue.shade100,
//                         child: Column(
//                           mainAxisSize: MainAxisSize.max,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('Personal Details', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),
//                             SizedBox(height: 10),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   height: 17,
//                                   width: 17,
//                                   decoration: BoxDecoration(
//                                       image: DecorationImage(
//                                         image: AssetImage('assets/image/genderLogo.png'),
//                                       )
//                                   ),
//                                 ),
//                                 SizedBox(width: 10),
//                                 Text('${widget.resume.gender}'),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Container(
//                                   height: 17,
//                                   width: 17,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage('assets/image/dobLogo.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(width: 10),
//                                 Text('${widget.resume.dob}'),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Container(
//                                   height: 15,
//                                   width: 15,
//                                   decoration: BoxDecoration(
//                                       image: DecorationImage(
//                                         image: AssetImage('assets/image/callLogo.png'),
//                                       )
//                                   ),
//                                 ),
//                                 SizedBox(width: 13),
//                                 Text('${widget.resume.mobileNum}')
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Container(
//                                   height: 20,
//                                   width: 20,
//                                   decoration: BoxDecoration(
//                                       image: DecorationImage(
//                                         image: AssetImage('assets/image/emailLogo.webp'),
//                                       )
//                                   ),
//                                 ),
//                                 SizedBox(width: 10),
//                                 Text('${widget.resume.email}'),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Container(
//                                   height: 15,
//                                   width: 15,
//                                   decoration: BoxDecoration(
//                                       image: DecorationImage(
//                                         image: AssetImage('assets/image/location.png'),
//                                       )
//                                   ),
//                                 ),
//                                 SizedBox(width: 12),
//                                 Text('${widget.resume.address}'),
//                               ],
//                             ),
//
//                             SizedBox(height: 10),
//                             Text('Skills Details', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),
//                             Text('${widget.selectedChips}'),
//
//                             SizedBox(height: 10),
//                             Text('Experience Details', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),
//                             SizedBox(height: 5),
//                             Text('${widget.experienceDetails[0].title}'),
//                             Text('Company: ${widget.experienceDetails[0].company}'),
//                             Text('Duration: ${widget.experienceDetails[0].duration}'),
//                             Text('Descripation: ${widget.experienceDetails[0].description} '),
//                             SizedBox(height: 10),
//                             Text('${widget.experienceDetails[1].title}'),
//                             Text('Company: ${widget.experienceDetails[1].company}'),
//                             Text('Duration: ${widget.experienceDetails[1].duration}'),
//                             Text('Descripation: ${widget.experienceDetails[1].description} '),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Container(
//                         padding: EdgeInsets.all(12),
//                         color: Colors.blue.shade200,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Text('Education Details', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),
//                             SizedBox(height: 10),
//                             Text('10th Detail', style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w400),),
//                             Text('${widget.resume.sNameT}'),
//                             Text('Complete in ${widget.resume.timeT}'),
//                             Text('Result: ${widget.resume.perT} %'),
//                             SizedBox(height: 10),
//                             Text('12th Detail', style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w400),),
//                             Text('${widget.resume.sNameTw}'),
//                             Text('Stream: ${widget.resume.streamTw}'),
//                             Text('Complete in ${widget.resume.timeTw}'),
//                             Text('Result: ${widget.resume.perTw} %'),
//                             SizedBox(height: 10),
//                             Text('More Detail', style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w400),),
//                             Text('${widget.resume.sNameGr}'),
//                             Text('Stream: ${widget.resume.locationGr}'),
//                             Text('Complete in ${widget.resume.timeGr}'),
//                             Text('Result: ${widget.resume.resultGr} %'),
//                             SizedBox(height: 10),
//                             Text('More Detail', style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w400),),
//                             Text('${widget.resume.sNameMo}'),
//                             Text('Stream: ${widget.resume.locationMo}'),
//                             Text('Complete in ${widget.resume.timeMo}'),
//                             Text('Result: ${widget.resume.resultMo} %'),
//
//                             SizedBox(height: 10),
//                             Text('Project Details', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),
//                             SizedBox(height: 10),
//                             Text('${widget.ProjectDetails[0].title}'),
//                             Text('Company: ${widget.ProjectDetails[0].company}'),
//                             Text('Duration: ${widget.ProjectDetails[0].typeofproject}'),
//                             Text('Descripation: ${widget.ProjectDetails[0].description} '),
//
//                             TextButton(
//                                 onPressed: () {
//                                   makePdf();
//                                 },
//                                 child: Text('Create Pdf'),
//                             ),
//
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> makePdf() async{
//
//     final pdf = p.Document();
//     pdf.addPage(
//       p.Page(build: (context){
//         return p.Column(
//           children: [
//             p.Text('Pdf')
//           ],
//         );
//       })
//     );
//
//    Directory root = await getApplicationDocumentsDirectory();
//    String path = '${root.path}/test.pdf';
//    final file = File(path);
//    await file.writeAsBytes(await pdf.save());
//    print('Path : $path');
//
//   }
//
// }

/// pdf 2nd code
// import 'dart:io';
// import 'dart:math';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:screenshot/screenshot.dart';
// import 'package:date_format/date_format.dart';
//
// class Ready extends StatefulWidget {
//   final Resume resume;
//   final List<ProjectDetails> projectDetails;
//   final List<ExperienceDetails> experienceDetails;
//   final List<String> selectedChips;
//
//   Ready(this.resume, this.projectDetails, this.experienceDetails, this.selectedChips);
//
//   @override
//   State<Ready> createState() => _ReadyState();
// }
//
// class _ReadyState extends State<Ready> {
//   final ScreenshotController _screenshotController = ScreenshotController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               _buildHeader(),
//               _buildDetails(),
//               SizedBox(height: 10),
//               TextButton(
//                 onPressed: () {
//                   _takeScreenshot(context);
//                 },
//                 child: Text('Create Pdf'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHeader() {
//     return Container(
//       color: Colors.blue.shade50,
//       height: 110,
//       width: double.infinity,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           CircleAvatar(
//               radius: 45,
//               backgroundImage: AssetImage('assets/image/girl3.jpg')),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text('${widget.resume.middleName} ${widget.resume.firstName}',
//                   style: TextStyle(color: Colors.black, fontSize: 21, fontWeight: FontWeight.w500)),
//               Text('${widget.resume.jobTitle}',
//                   style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.w500)),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildDetails() {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildLeftColumn(),
//         _buildRightColumn(),
//       ],
//     );
//   }
//
//   Widget _buildLeftColumn() {
//     return Container(
//       width: MediaQuery.of(context).size.width / 2,
//       padding: EdgeInsets.all(12),
//       color: Colors.blue.shade100,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildSectionTitle('Personal Details'),
//           _buildPersonalDetailRow('assets/image/genderLogo.png', widget.resume.gender),
//           _buildPersonalDetailRow('assets/image/dobLogo.png', widget.resume.dob),
//           _buildPersonalDetailRow('assets/image/callLogo.png', widget.resume.mobileNum),
//           _buildPersonalDetailRow('assets/image/emailLogo.webp', widget.resume.email),
//           _buildPersonalDetailRow('assets/image/location.png', widget.resume.address),
//           _buildSectionTitle('Skills Details'),
//           Text(widget.selectedChips.join(', ')),
//           _buildSectionTitle('Experience Details'),
//           _buildExperienceDetail(widget.experienceDetails),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildRightColumn() {
//     return Container(
//       width: MediaQuery.of(context).size.width / 2,
//       padding: EdgeInsets.all(12),
//       color: Colors.blue.shade200,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildSectionTitle('Education Details'),
//           _buildEducationDetail('10th Detail', widget.resume.sNameT, widget.resume.timeT, widget.resume.perT),
//           _buildEducationDetail('12th Detail', widget.resume.sNameTw, widget.resume.timeTw, widget.resume.perTw, stream: widget.resume.streamTw),
//           _buildEducationDetail('Graduation Detail', widget.resume.sNameGr, widget.resume.timeGr, widget.resume.resultGr, stream: widget.resume.locationGr),
//           _buildEducationDetail('Post Graduation Detail', widget.resume.sNameMo, widget.resume.timeMo, widget.resume.resultMo, stream: widget.resume.locationMo),
//           _buildSectionTitle('Project Details'),
//           _buildProjectDetail(widget.projectDetails),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSectionTitle(String title) {
//     return Text(title, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500));
//   }
//
//   Widget _buildPersonalDetailRow(String iconPath, String detail) {
//     return Row(
//       children: [
//         Image.asset(iconPath, height: 17, width: 17),
//         SizedBox(width: 10),
//         Text(detail),
//       ],
//     );
//   }
//
//   Widget _buildExperienceDetail(List<ExperienceDetails> experienceDetails) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: experienceDetails.map((exp) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(exp.title),
//             Text('Company: ${exp.company}'),
//             Text('Duration: ${exp.duration}'),
//             Text('Description: ${exp.description}'),
//             SizedBox(height: 10),
//           ],
//         );
//       }).toList(),
//     );
//   }
//
//   Widget _buildEducationDetail(String title, String name, String time, String result, {String? stream}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('$title :-', style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w400)),
//         Text(name),
//         if (stream != null) Text('Stream: $stream'),
//         Text('Completed in $time'),
//         Text('Result: $result %'),
//         SizedBox(height: 10),
//       ],
//     );
//   }
//
//   Widget _buildProjectDetail(List<ProjectDetails> projectDetails) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: projectDetails.map((project) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(project.title),
//             Text('Company: ${project.company}'),
//             Text('Duration: ${project.typeofproject}'),
//             Text('Description: ${project.description}'),
//             SizedBox(height: 10),
//           ],
//         );
//       }).toList(),
//     );
//   }
//
//   void _takeScreenshot(BuildContext context) {
//     _screenshotController
//         .captureFromWidget(InheritedTheme.captureAll(context, Material(child: _buildDetails())))
//         .then((capturedImage) {
//       _exportScreenshotToPdf(context, capturedImage);
//     });
//   }
//
//   Future<void> _exportScreenshotToPdf(BuildContext context, Uint8List screenshot) async {
//     final pdf = pw.Document();
//     pdf.addPage(
//       pw.Page(
//         pageFormat: PdfPageFormat.a4,
//         build: (context) {
//           return pw.Center(
//             child: pw.Image(pw.MemoryImage(screenshot), fit: pw.BoxFit.contain),
//           );
//         },
//       ),
//     );
//     Directory documentDirectory = await getApplicationDocumentsDirectory();
//     String documentPath = documentDirectory.path;
//
//     File pdfFile = File(
//         '$documentPath/${_getRandomString(10)}-${formatDate(DateTime.now(), [dd, '-', mm, '-', yyyy])}.pdf');
//     pdfFile.writeAsBytesSync(await pdf.save());
//   }
//
//   String _getRandomString(int length) {
//     const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
//     Random rnd = Random();
//     return String.fromCharCodes(Iterable.generate(length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
//   }
// }
//
// class Resume {
//   final String firstName;
//   final String middleName;
//   final String jobTitle;
//   final String gender;
//   final String dob;
//   final String mobileNum;
//   final String email;
//   final String address;
//   final String sNameT;
//   final String timeT;
//   final String perT;
//   final String sNameTw;
//   final String streamTw;
//   final String timeTw;
//   final String perTw;
//   final String sNameGr;
//   final String locationGr;
//   final String timeGr;
//   final String resultGr;
//   final String sNameMo;
//   final String locationMo;
//   final String timeMo;
//   final String resultMo;
//
//   Resume({
//     required this.firstName,
//     required this.middleName,
//     required this.jobTitle,
//     required this.gender,
//     required this.dob,
//     required this.mobileNum,
//     required this.email,
//     required this.address,
//     required this.sNameT,
//     required this.timeT,
//     required this.perT,
//     required this.sNameTw,
//     required this.streamTw,
//     required this.timeTw,
//     required this.perTw,
//     required this.sNameGr,
//     required this.locationGr,
//     required this.timeGr,
//     required this.resultGr,
//     required this.sNameMo,
//     required this.locationMo,
//     required this.timeMo,
//     required this.resultMo,
//   });
// }
//
// class ProjectDetails {
//   final String title;
//   final String company;
//   final String typeofproject;
//   final String description;
//
//   ProjectDetails({
//     required this.title,
//     required this.company,
//     required this.typeofproject,
//     required this.description,
//   });
// }
//
// class ExperienceDetails {
//   final String title;
//   final String company;
//   final String duration;
//   final String description;
//
//   ExperienceDetails({
//     required this.title,
//     required this.company,
//     required this.duration,
//     required this.description,
//   });
// }

/// CF pdf

class Ready extends StatefulWidget {
  final Resume resume;
  late List ProjectDetails;
  late List experienceDetails;
  final List<String> selectedChips;

  Ready(this.resume, this.ProjectDetails, this.experienceDetails,
      this.selectedChips);

  @override
  State<Ready> createState() => _ReadyState();
}

class _ReadyState extends State<Ready> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text('Resume'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${widget.resume.middleName ?? ''} ${widget.resume.firstName ?? ''}",
                  style: TextStyle(
                    fontSize: 41,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue.shade900,
                  ),
                ),
                SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.resume.jobTitle ?? '',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      (widget.resume.mobileNum != null && widget.resume.email != null)
                          ? 'Contact: ${widget.resume.mobileNum} \nEmail: ${widget.resume.email}'
                          : '',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  width: double.maxFinite,
                  color: Colors.black,
                  height: 3,
                ),
                SizedBox(height: 10),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 30,
                        width: double.maxFinite,
                        color: Colors.grey.shade300,
                        child: Text('Personal Details', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                      ),
                      if (widget.resume.middleName != null)
                        Text(
                          'Name: ${widget.resume.firstName} ${widget.resume.middleName} ${widget.resume.lastName}',
                          style: TextStyle(fontSize: 20),
                        ),
                      if (widget.resume.dob != null)
                        Text(
                          'DOB: ${widget.resume.dob}',
                          style: TextStyle(fontSize: 20),
                        ),
                      if (widget.resume.gender != null)
                        Text(
                          'Gender: ${widget.resume.gender}',
                          style: TextStyle(fontSize: 20),
                        ),
                      if (widget.resume.email != null)
                        Text(
                          'Email: ${widget.resume.email}',
                          style: TextStyle(fontSize: 20),
                        ),
                      if (widget.resume.mobileNum != null)
                        Text(
                          'Mobile No.: ${widget.resume.mobileNum}',
                          style: TextStyle(fontSize: 20),
                        ),
                      if (widget.resume.address != null)
                        Text(
                          'Address: ${widget.resume.address}',
                          style: TextStyle(fontSize: 20),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (widget.resume.sNameT != null || widget.resume.timeT != null ||  widget.resume.perT != null ||
                        widget.resume.sNameTw != null || widget.resume.streamTw != null ||  widget.resume.timeTw != null ||  widget.resume.perTw != null ||
                        widget.resume.sNameGr != null || widget.resume.locationGr != null ||  widget.resume.timeGr != null ||  widget.resume.resultGr != null ||
                        widget.resume.sNameMo != null || widget.resume.locationMo != null ||  widget.resume.timeMo != null ||  widget.resume.resultMo != null)
                      Container(
                        height: 690,
                        width: 400,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 30,
                              width: double.maxFinite,
                              color: Colors.grey.shade300,
                              child: Text('Education Details', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                            ),
                            Text('10th Detail :-' ,style: TextStyle(color: Colors.black, fontSize: 23, fontWeight: FontWeight.w600),),
                            if (widget.resume.sNameT != null)
                              Text(
                                'School Name:  ${widget.resume.sNameT}',
                                style: TextStyle(fontSize: 20),
                              ),
                            if (widget.resume.timeT != null)
                              Text(
                                'Passing Date:  ${widget.resume.timeT}',
                                style: TextStyle(fontSize: 20),
                              ),
                            if (widget.resume.perT != null)
                              Text(
                                'percentage:  ${widget.resume.perT} %',
                                style: TextStyle(fontSize: 20),
                              ),
                            Text('12th Detail :-' ,style: TextStyle(color: Colors.black, fontSize: 23, fontWeight: FontWeight.w600),),
                            if (widget.resume.sNameTw != null)
                              Text(
                                'School Name:  ${widget.resume.sNameTw}',
                                style: TextStyle(fontSize: 20),
                              ),
                            if (widget.resume.streamTw != null)
                              Text(
                                'Stream: ${widget.resume.streamTw}',
                                style: TextStyle(fontSize: 20),
                              ),
                            if (widget.resume.timeTw != null)
                              Text(
                                'Passing Date: ${widget.resume.timeTw}',
                                style: TextStyle(fontSize: 20),
                              ),
                            if (widget.resume.perTw != null)
                              Text(
                                'Percentage: ${widget.resume.perTw} %',
                                style: TextStyle(fontSize: 20),
                              ),
                            Text('Graduation Detail :-' ,style: TextStyle(color: Colors.black, fontSize: 23, fontWeight: FontWeight.w600),),
                            if (widget.resume.sNameGr != null)
                              Text(
                                'Collage/Institute Name: ${widget.resume.sNameGr}',
                                style: TextStyle(fontSize: 20),
                              ),
                            if (widget.resume.locationGr != null)
                              Text(
                                'Graduation course: ${widget.resume.locationGr}',
                                style: TextStyle(fontSize: 20),
                              ),
                            if (widget.resume.timeGr != null)
                              Text(
                                'Passing Date: ${widget.resume.timeGr}',
                                style: TextStyle(fontSize: 20),
                              ),
                            if (widget.resume.resultGr != null)
                              Text(
                                'Percentage: ${widget.resume.resultGr} %',
                                style: TextStyle(fontSize: 20),
                              ),
                            Text('More Graduation Detail :-' ,style: TextStyle(color: Colors.black, fontSize: 23, fontWeight: FontWeight.w600),),
                            if (widget.resume.sNameMo != null)
                              Text(
                                'Collage/Institute Name: ${widget.resume.sNameMo}',
                                style: TextStyle(fontSize: 20),
                              ),
                            if (widget.resume.locationMo != null)
                              Text(
                                'Graduation course: ${widget.resume.locationMo}',
                                style: TextStyle(fontSize: 20),
                              ),
                            if (widget.resume.timeMo != null)
                              Text(
                                'Passing Date: ${widget.resume.timeMo}',
                                style: TextStyle(fontSize: 20),
                              ),
                            if (widget.resume.resultMo != null)
                              Text(
                                'Percentage: ${widget.resume.resultMo} %',
                                style: TextStyle(fontSize: 20),
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (widget.experienceDetails != null && widget.experienceDetails!.isNotEmpty)
                      Container(
                        width: 200,
                        height: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 30,
                              width: double.maxFinite,
                              color: Colors.grey.shade300,
                              child: Text('Education Details', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: widget.experienceDetails!.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Title: ${widget.experienceDetails[0].title}',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text('Company Name: ${widget.experienceDetails[0].company}',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text('Duration: ${widget.experienceDetails[0].duration}',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text('description: ${widget.experienceDetails[0].description}',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (widget.ProjectDetails != null && widget.ProjectDetails!.isNotEmpty)
                      Container(
                        width: 200,
                        height: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 30,
                              width: double.maxFinite,
                              color: Colors.grey.shade300,
                              child: Text('Project Details', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: widget.ProjectDetails!.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('Title: ${widget.ProjectDetails[0].title}',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text('Company Name: ${widget.ProjectDetails[0].company}',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text('Duration: ${widget.ProjectDetails[0].typeofproject}',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text('description: ${widget.ProjectDetails[0].description}',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
                  Column(
                    children: [
                      if (widget.selectedChips != null && widget.selectedChips!.isNotEmpty)
                      Container(
                        height: 200,
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 30,
                              width: double.maxFinite,
                              color: Colors.grey.shade300,
                              child: Text('Skill Details', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: widget.selectedChips!.length,
                                itemBuilder: (context, index) {
                                  return Text(
                                    widget.selectedChips![index],
                                    style: TextStyle(fontSize: 20),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: 20),
                Center(
                  child: Container(
                    height: 30,
                    width: double.maxFinite,
                    color: Colors.grey.shade300,
                    child: Text('Declaration', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                  ),
                ),
                Text(
                  'I hereby declare that the information furnished above is to the best of my knowledge.',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      await _createPDF();
                    },
                    child: Text('Save as PDF'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _createPDF() async {
    final pdf = pw.Document();

    pdf.addPage(
        pw.Page(
          build: (pw.Context context) => pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
          pw.Text(
            '${widget.resume.middleName} ${widget.resume.firstName} ' ?? '',
            style: pw.TextStyle(
              fontSize: 41,
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.blue900,
            ),
          ),
          pw.SizedBox(height: 10),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
            children: [
              pw.Text(
                widget.resume.jobTitle ?? '',
                style: pw.TextStyle(
                  fontSize: 25,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text(
                (widget.resume.mobileNum != null && widget.resume.email != null)
                    ? 'Contact:${widget.resume.mobileNum} \nEmail:${widget.resume.email}'
                    : '',
                style: pw.TextStyle(fontSize: 20),
              ),
            ],
          ),
          pw.SizedBox(height: 10),
          pw.Container(
            width: double.maxFinite,
            color: PdfColors.black,
            height: 3,
          ),
          pw.SizedBox(height: 10),
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Container(
                height: 20,
                width: 250,
                color: PdfColors.grey300,
                child: pw.Text('Personal Detail', textAlign: pw.TextAlign.center),
              ),
              if (widget.resume.middleName != null)
                pw.Text(
                  'Name: ${widget.resume.middleName}',
                  style: pw.TextStyle(fontSize: 20),
                ),
              if (widget.resume.dob != null)
                pw.Text(
                  'DOB: ${widget.resume.dob}',
                  style: pw.TextStyle(fontSize: 20),
                ),
              if (widget.resume.gender != null)
                pw.Text(
                  'Gender: ${widget.resume.gender}',
                  style: pw.TextStyle(fontSize: 20),
                ),
              if (widget.resume.email != null)
                pw.Text(
                  'Email Address: ${widget.resume.email}',
                  style: pw.TextStyle(fontSize: 20),
                ),
              if (widget.resume.address != null)
                pw.Text(
                  'Mobile No.: ${widget.resume.mobileNum}',
                  style: pw.TextStyle(fontSize: 20),
                ),
              if (widget.resume.address != null)
                pw.Text(
                  'Address: ${widget.resume.address}',
                  style: pw.TextStyle(fontSize: 20),
                ),
            ],
          ),
          pw.SizedBox(height: 20),
          pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
              children: [
                if (widget.resume.sNameT != null || widget.resume.timeT != null ||  widget.resume.perT != null ||
                    widget.resume.sNameTw != null || widget.resume.streamTw != null ||  widget.resume.timeTw != null ||  widget.resume.perTw != null ||
                    widget.resume.sNameGr != null || widget.resume.locationGr != null ||  widget.resume.timeGr != null ||  widget.resume.resultGr != null ||
                    widget.resume.sNameMo != null || widget.resume.locationMo != null ||  widget.resume.timeMo != null ||  widget.resume.resultMo != null)
          pw.Container(
             height: 170,
             width: 200,
               child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                     pw.Container(
                        width: double.maxFinite,
                        color: PdfColors.grey300,
                        child: pw.Text('Education Detail', textAlign: pw.TextAlign.center),
                      ),
              pw. Text('10th Detail :-' ,style: pw.TextStyle(fontSize: 23,),),
              if (widget.resume.sNameT != null)
                pw.Text(
                  'School Name: ${widget.resume.sNameT}',
                  style: pw.TextStyle(fontSize: 20),
                ),
              if (widget.resume.timeT != null)
                pw.Text(
                  'Passing Date: ${widget.resume.timeT}',
                  style: pw.TextStyle(fontSize: 20),
                ),
              if (widget.resume.perT != null)
                pw.Text(
                  'Percentage: ${widget.resume.perT} %',
                  style: pw.TextStyle(fontSize: 20),
                ),
                      pw. Text('10th Detail :-' ,style: pw.TextStyle(fontSize: 23,),),
              if (widget.resume.sNameTw != null)
                pw.Text(
                  'School Name: ${widget.resume.sNameTw}',
                  style: pw.TextStyle(fontSize: 20),
                ),
              if (widget.resume.streamTw != null)
                pw.Text(
                  'Stream: ${widget.resume.streamTw}',
                  style: pw.TextStyle(fontSize: 20),
                ),
              if (widget.resume.timeTw != null)
                pw.Text(
                  'Passing Date: ${widget.resume.timeTw}',
                  style: pw.TextStyle(fontSize: 20),
                ),
              if (widget.resume.perTw != null)
                pw.Text(
                  'Percentage: ${widget.resume.perTw} %',
                  style: pw.TextStyle(fontSize: 20),
                ),
              if (widget.resume.sNameGr != null)
                pw.Text(
                  'Collage/Institute Name: ${widget.resume.sNameGr}',
                  style: pw.TextStyle(fontSize: 20),
                ),
              if (widget.resume.locationGr != null)
                pw.Text(
                  'Graduation course: ${widget.resume.locationGr}',
                  style: pw.TextStyle(fontSize: 20),
                ),
              if (widget.resume.timeGr != null)
                pw.Text(
                  'Passing Date: ${widget.resume.timeGr}',
                  style: pw.TextStyle(fontSize: 20),
                ),
              if (widget.resume.resultGr != null)
                pw.Text(
                  'Percentage: ${widget.resume.resultGr} %',
                  style: pw.TextStyle(fontSize: 20),
                ),
              if (widget.resume.sNameMo != null)
                pw.Text(
                  'Collage/Institute Name: ${widget.resume.sNameMo}',
                  style: pw.TextStyle(fontSize: 20),
                ),
              if (widget.resume.locationMo != null)
                pw.Text(
                  'Graduation course: ${widget.resume.locationMo}',
                  style: pw.TextStyle(fontSize: 20),
                ),
              if (widget.resume.timeMo != null)
                pw.Text(
                  'Passing Date: ${widget.resume.timeMo}',
                  style: pw.TextStyle(fontSize: 20),
                ),
              if (widget.resume.resultMo != null)
                pw.Text(
                  'Percentage: ${widget.resume.resultMo} %',
                  style: pw.TextStyle(fontSize: 20),
                ),
            ],
          ),
        ),
        if (widget.experienceDetails != null && widget.experienceDetails!.isNotEmpty)
    pw.Container(
        height: 170,
        width: 230,
        child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
        pw.Container(
        width: double.maxFinite,
        color: PdfColors.grey300,
        child: pw.Text('Experience Detail', textAlign: pw.TextAlign.center),
    ),
    pw.Expanded(
    child: pw.ListView.builder(
    itemCount: widget.experienceDetails!.length,
    itemBuilder: (context, index) {
      return pw.Circle();
    }
    ),
    ),
    ]
    ),
    ),
    ]
    ),
    ]
    ),),
    );
         Directory root = await getApplicationDocumentsDirectory();
         String path = '${root.path}/test.pdf';
          final file = File(path);
          await file.writeAsBytes(await pdf.save());
           print('Path : $path');

  }
}