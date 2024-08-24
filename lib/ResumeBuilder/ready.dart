import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw ;
import 'package:rnewapp/ResumeBuilder/projectDetail.dart';
import 'experienceDetail.dart';
import 'model/allClass.dart';

class ready extends StatefulWidget {
  final Resume resume;
  late List ProjectDetails;
  late List experienceDetails;
  late final List<String> selectedChips;

  ready(this.resume, this.ProjectDetails, this.experienceDetails,
      this.selectedChips);

  @override
  State<ready> createState() => _readyState();
}

class _readyState extends State<ready> {

  List<Resume> usersList = [];

  @override
  Widget build(BuildContext context) {
    print('Data :- ${widget.resume.firstName}');
    print('Experience Length :- ${widget.experienceDetails.length}');
    print('Project Length :- ${widget.ProjectDetails[0].title}');
    // final ScreenshotController _screenshotController = ScreenshotController();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                        Text('${widget.resume.middleName} ${widget.resume
                            .firstName}', style: TextStyle(color: Colors.black,
                            fontSize: 21,
                            fontWeight: FontWeight.w500),),
                        Text('${widget.resume.jobTitle}',
                          style: TextStyle(color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.w500),),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: (MediaQuery
                        .sizeOf(context)
                        .height),
                    width: (MediaQuery
                        .sizeOf(context)
                        .width) / 2,
                    padding: EdgeInsets.all(12),
                    color: Colors.blue.shade100,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Personal Details', style: TextStyle(color: Colors
                            .black, fontSize: 20, fontWeight: FontWeight
                            .w500),),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 17,
                              width: 17,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/image/genderLogo.png'),
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
                                    image: AssetImage(
                                        'assets/image/callLogo.png'),
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
                                    image: AssetImage(
                                        'assets/image/emailLogo.webp'),
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
                                    image: AssetImage(
                                        'assets/image/location.png'),
                                  )
                              ),
                            ),
                            SizedBox(width: 12),
                            Text('${widget.resume.address}'),
                          ],
                        ),

                        SizedBox(height: 10),
                        Text('Skills Details', style: TextStyle(color: Colors
                            .black, fontSize: 20, fontWeight: FontWeight
                            .w500),),
                        Text('${widget.selectedChips}'),

                        SizedBox(height: 10),
                        Text(
                          'Experience Details', style: TextStyle(color: Colors
                            .black, fontSize: 20, fontWeight: FontWeight
                            .w500),),
                        SizedBox(height: 5),
                        Text('${widget.experienceDetails[0].title}'),
                        Text('Company: ${widget.experienceDetails[0].company}'),
                        Text('Duration: ${widget.experienceDetails[0]
                            .duration}'),
                        Text('Descripation: ${widget.experienceDetails[0]
                            .description} '),
                        // SizedBox(height: 10),
                        // Text('${widget.experienceDetails[1].title}'),
                        // Text('Company: ${widget.experienceDetails[1].company}'),
                        // Text('Duration: ${widget.experienceDetails[1].duration}'),
                        // Text('Descripation: ${widget.experienceDetails[1].description} '),
                      ],
                    ),
                  ),
                  Container(
                    height: (MediaQuery
                        .sizeOf(context)
                        .height),
                    width: (MediaQuery
                        .sizeOf(context)
                        .width) / 2,
                    padding: EdgeInsets.all(12),
                    color: Colors.blue.shade200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Education Details', style: TextStyle(color: Colors
                            .black, fontSize: 20, fontWeight: FontWeight
                            .w500),),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            // Container(
                            //   height: 15,
                            //   width: 15,
                            //   decoration: BoxDecoration(
                            //       image: DecorationImage(
                            //         image: AssetImage('assets/image/singleDotLogo.png'),
                            //       )
                            //   ),
                            // ),
                            Text('10th Detail :-', style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w400),),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text('${widget.resume.sNameT}'),
                        Text('Complete in ${widget.resume.timeT}'),
                        Text('Result: ${widget.resume.perT} %'),
                        SizedBox(height: 10),
                        Text('12th Detail :-', style: TextStyle(color: Colors
                            .black, fontSize: 17, fontWeight: FontWeight
                            .w400),),
                        SizedBox(height: 5),
                        Text('${widget.resume.sNameTw}'),
                        Text('Stream: ${widget.resume.streamTw}'),
                        Text('Complete in ${widget.resume.timeTw}'),
                        Text('Result: ${widget.resume.perTw} %'),
                        SizedBox(height: 10),
                        Text('More Detail', style: TextStyle(color: Colors
                            .black, fontSize: 17, fontWeight: FontWeight
                            .w400),),
                        SizedBox(height: 5),
                        Text('${widget.resume.sNameGr}'),
                        Text('Stream: ${widget.resume.locationGr}'),
                        Text('Complete in ${widget.resume.timeGr}'),
                        Text('Result: ${widget.resume.resultGr} %'),
                        SizedBox(height: 10),
                        Text('More Detail', style: TextStyle(color: Colors
                            .black, fontSize: 17, fontWeight: FontWeight
                            .w400),),
                        SizedBox(height: 5),
                        Text('${widget.resume.sNameMo}'),
                        Text('Stream: ${widget.resume.locationMo}'),
                        Text('Complete in ${widget.resume.timeMo}'),
                        Text('Result: ${widget.resume.resultMo} %'),
                        SizedBox(height: 10),
                        Text('Project Details', style: TextStyle(color: Colors
                            .black, fontSize: 20, fontWeight: FontWeight
                            .w500),),
                        SizedBox(height: 10),
                        Text('${widget.ProjectDetails[0].title}'),
                        Text('Company: ${widget.ProjectDetails[0].company}'),
                        Text('Duration: ${widget.ProjectDetails[0]
                            .typeofproject}'),
                        Text('Descripation: ${widget.ProjectDetails[0]
                            .description} '),
                        SizedBox(height: 50),
                        Container(
                          color: Colors.white38,
                          height: 50,
                          width: 180,
                          child: TextButton(
                            onPressed: () async {
                              // Collect the necessary data
                              Resume resume = widget.resume;
                              List projectDetails = widget.ProjectDetails;
                              List experienceDetails = widget.experienceDetails;
                              List<String> selectedChips = widget.selectedChips;

                              // Call _createPDF with the collected data
                              await _createPDF(resume, projectDetails, experienceDetails, selectedChips);
                            },
                            child: Text(
                              'Create Pdf',
                              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _createPDF(
    Resume resume,
    List projectDetails,
    List experienceDetails,
    List<String> selectedChips,
    ) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            '${resume.middleName} ${resume.firstName} ' ?? '',
            style: pw.TextStyle(
              fontSize: 28, // Reduced font size
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.blue900,
            ),
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            // Adjusted alignment
            children: [
              pw.Text(
                resume.jobTitle ?? '',
                style: pw.TextStyle(
                  fontSize: 18, // Reduced font size
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text(
                (resume.mobileNum != null && resume.email != null)
                    ? 'Contact:${resume.mobileNum} \nEmail:${resume.email}'
                    : '',
                style: pw.TextStyle(fontSize: 14), // Reduced font size
              ),
            ],
          ),
          pw.SizedBox(height: 5), // Reduced spacing
          pw.Container(
            width: double.maxFinite,
            color: PdfColors.black,
            height: 2, // Reduced height
          ),
          pw.SizedBox(height: 5), // Reduced spacing
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Container(
                height: 15, // Reduced height
                width: 180, // Reduced width
                color: PdfColors.grey300,
                child: pw.Text('Personal Detail',
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(fontSize: 16)), // Reduced font size
              ),
              if (resume.middleName != null)
                pw.Text(
                  'Name: ${resume.middleName}',
                  style: pw.TextStyle(fontSize: 20),
                ),
              if (resume.dob != null)
                pw.Text(
                  'DOB: ${resume.dob}',
                  style: pw.TextStyle(fontSize: 16),
                ),
              if (resume.gender != null)
                pw.Text(
                  'Gender: ${resume.gender}',
                  style: pw.TextStyle(fontSize: 16),
                ),
              if (resume.email != null)
                pw.Text(
                  'Email Address: ${resume.email}',
                  style: pw.TextStyle(fontSize: 16),
                ),
              if (resume.address != null)
                pw.Text(
                  'Mobile No.: ${resume.mobileNum}',
                  style: pw.TextStyle(fontSize: 16),
                ),
              if (resume.address != null)
                pw.Text(
                  'Address: ${resume.address}',
                  style: pw.TextStyle(fontSize: 16), // Reduced font size
                ),
            ],
          ),
          pw.SizedBox(height: 5), // Reduced spacing
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            // Adjusted alignment
            children: [
              if (resume.sNameT != null || resume.timeT != null ||  resume.perT != null ||
                  resume.sNameTw != null || resume.streamTw != null ||  resume.timeTw != null ||  resume.perTw != null ||
                  resume.sNameGr != null || resume.locationGr != null ||  resume.timeGr != null ||  resume.resultGr != null ||
                  resume.sNameMo != null || resume.locationMo != null ||  resume.timeMo != null ||  resume.resultMo != null)
                pw.Container(
                  height: 140, // Reduced height
                  width: 160, // Reduced width
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Container(
                        width: double.maxFinite,
                        color: PdfColors.grey300,
                        child: pw.Text('Education Detail',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                                fontSize: 16)), // Reduced font size
                      ),
                      if (resume.sNameT != null)
                        pw.Text(
                          'School Name: ${resume.sNameT}',
                          style: pw.TextStyle(fontSize: 14),
                        ),
                      if (resume.timeT != null)
                        pw.Text(
                          'Passing Date: ${resume.timeT}',
                          style: pw.TextStyle(fontSize: 14),
                        ),
                      if (resume.perT != null)
                        pw.Text(
                          'Percentage: ${resume.perT} %',
                          style: pw.TextStyle(fontSize: 14),
                        ),
                      if (resume.sNameTw != null)
                        pw.Text(
                          'School Name: ${resume.sNameTw}',
                          style: pw.TextStyle(fontSize: 14),
                        ),
                      if (resume.streamTw != null)
                        pw.Text(
                          'Stream: ${resume.streamTw}',
                          style: pw.TextStyle(fontSize: 14),
                        ),
                      if (resume.timeTw != null)
                        pw.Text(
                          'Passing Date: ${resume.timeTw}',
                          style: pw.TextStyle(fontSize: 14),
                        ),
                      if (resume.perTw != null)
                        pw.Text(
                          'Percentage: ${resume.perTw} %',
                          style: pw.TextStyle(fontSize: 14),
                        ),
                      if (resume.sNameGr != null)
                        pw.Text(
                          'Collage/Institute Name: ${resume.sNameGr}',
                          style: pw.TextStyle(fontSize: 14),
                        ),
                      if (resume.locationGr != null)
                        pw.Text(
                          'Graduation course: ${resume.locationGr}',
                          style: pw.TextStyle(fontSize: 14),
                        ),
                      if (resume.timeGr != null)
                        pw.Text(
                          'Passing Date: ${resume.timeGr}',
                          style: pw.TextStyle(fontSize: 14),
                        ),
                      if (resume.resultGr != null)
                        pw.Text(
                          'Percentage: ${resume.resultGr} %',
                          style: pw.TextStyle(fontSize: 14),
                        ),
                      if (resume.sNameMo != null)
                        pw.Text(
                          'Collage/Institute Name: ${resume.sNameMo}',
                          style: pw.TextStyle(fontSize: 20),
                        ),
                      if (resume.locationMo != null)
                        pw.Text(
                          'Graduation course: ${resume.locationMo}',
                          style: pw.TextStyle(fontSize: 20),
                        ),
                      if (resume.timeMo != null)
                        pw.Text(
                          'Passing Date: ${resume.timeMo}',
                          style: pw.TextStyle(fontSize: 20),
                        ),
                      if (resume.resultMo != null)
                        pw.Text(
                          'Percentage: ${resume.resultMo} %',
                          style: pw.TextStyle(fontSize: 20),
                        ),
                    ],
                  ),
                ),
              pw.Container(
                height: 140, // Reduced height
                width: 180, // Reduced width
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Container(
                      width: double.maxFinite,
                      color: PdfColors.grey300,
                      child: pw.Text('Experience Detail',
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 16)), // Reduced font size
                    ),
                    pw.Expanded(
                      child: pw.ListView.builder(
                        itemCount: experienceDetails.length,
                        itemBuilder: (context, index) {
                          return pw.Column(children: [
                            pw.Text(
                              experienceDetails[index].title,
                              style: pw.TextStyle(
                                  fontSize: 14), // Reduced font size
                            ),
                            pw.Text(
                              experienceDetails[index].company,
                              style: pw.TextStyle(
                                  fontSize: 14), // Reduced font size
                            ),
                            pw.Text(
                              experienceDetails[index].duration,
                              style: pw.TextStyle(
                                  fontSize: 14), // Reduced font size
                            ),
                            pw.Text(
                              experienceDetails[index].description,
                              style: pw.TextStyle(
                                  fontSize: 14), // Reduced font size
                            ),
                          ]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 5), // Reduced spacing
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            // Adjusted alignment
            children: [
              pw.Container(
                height: 140, // Reduced height
                width: 160, // Reduced width
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Container(
                      width: double.maxFinite,
                      color: PdfColors.grey300,
                      child: pw.Text('Project Detail',
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 16)), // Reduced font size
                    ),
                    pw.Expanded(
                      child: pw.ListView.builder(
                        itemCount: projectDetails.length,
                        itemBuilder: (context, index) {
                          return pw.Column(children: [
                            pw.Text(
                              projectDetails[index].title,
                              style: pw.TextStyle(
                                  fontSize: 14), // Reduced font size
                            ),
                            pw.Text(
                              projectDetails[index].company,
                              style: pw.TextStyle(
                                  fontSize: 14), // Reduced font size
                            ),
                            pw.Text(
                              projectDetails[index].typeofproject,
                              style: pw.TextStyle(
                                  fontSize: 14), // Reduced font size
                            ),
                            pw.Text(
                              projectDetails[index].description,
                              style: pw.TextStyle(
                                  fontSize: 14), // Reduced font size
                            ),
                          ]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              if (selectedChips != null && selectedChips.isNotEmpty)
                pw.Container(
                  height: 200, // Reduced height
                  width: 160, // Reduced width
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Container(
                        width: double.maxFinite,
                        color: PdfColors.grey300,
                        child: pw.Text('Skills',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                                fontSize: 16)), // Reduced font size
                      ),
                      pw.Expanded(
                        child: pw.ListView.builder(
                          itemCount: selectedChips.length,
                          itemBuilder: (context, index) {
                            return pw.Text(
                              selectedChips[index],
                              style: pw.TextStyle(
                                  fontSize: 14), // Reduced font size
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    ),
  );

  try {
    Directory root = await getApplicationDocumentsDirectory();
    String path = '${root.path}/resumee.pdf';
    final file = File(path);
    await file.writeAsBytes(await pdf.save());
    print("PDF saved at path: $path");
  } catch (e) {
    print("Error saving PDF: $e");
  }
}


