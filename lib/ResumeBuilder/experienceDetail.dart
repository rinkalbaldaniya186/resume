import 'package:flutter/material.dart';
import 'package:rnewapp/ResumeBuilder/model/Users.dart';
import 'package:rnewapp/ResumeBuilder/model/allClass.dart';
import 'package:rnewapp/ResumeBuilder/model/education.dart';
import 'package:rnewapp/ResumeBuilder/model/experience.dart';
import 'package:rnewapp/ResumeBuilder/projectDetail.dart';

class ExperienceDetail extends StatefulWidget {

  final Resume resume;
  ExperienceDetail({super.key, required this.resume});

  @override
  State<ExperienceDetail> createState() => _ExperienceDetailState(resume);
}

class _ExperienceDetailState extends State<ExperienceDetail> {
  bool _isExperienceSelected = false;
  bool _isFresherSelected = false;

  Resume resume;
  _ExperienceDetailState(this.resume);

  void _onExperienceChanged(bool? value) {
    setState(() {
      _isExperienceSelected = value!;
      if (_isFresherSelected && _isExperienceSelected) {
        _isFresherSelected = false;
      }
    });
  }

  void _onFresherChanged(bool? value) {
    setState(() {
      _isFresherSelected = value!;
      if (_isFresherSelected && _isExperienceSelected) {
        _isExperienceSelected = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.resume.firstName);
    print(widget.resume.sNameT);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add Experience Detail',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          backgroundColor: Colors.blue.shade400,
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: NetworkImage('https://img.freepik.com/premium-vector/hand-painted-watercolor-abstract-background_889452-17399.jpg'),
              )
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: _isExperienceSelected,
                      onChanged: _onExperienceChanged,
                    ),
                    const Text(
                      'Experience',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _isFresherSelected,
                      onChanged: _onFresherChanged,
                    ),
                    const Text('Fresher',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w500
                        )
                    ),
                  ],
                ),
                if (_isExperienceSelected) Flexible(child: ExperienceFieldForm(resume)),
                if (_isFresherSelected)
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 60,
                      width: 330,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProjectDetail.fresher(widget.resume),
                            ),
                          );
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        )
    );
  }
}

final TextEditingController _textFieldController = TextEditingController();
final TextEditingController _textFieldController2 = TextEditingController();
final TextEditingController _textFieldController3 = TextEditingController();
final TextEditingController _textFieldController4 = TextEditingController();

var titleP = _textFieldController.text;
var companyP = _textFieldController2.text;
var durationP = _textFieldController3.text;
var descriptionP  = _textFieldController4.text;

class ExperienceFieldForm extends StatefulWidget {
  Resume resume;
  ExperienceFieldForm(this.resume);

  @override
  State<ExperienceFieldForm> createState() => _ExperienceFieldFormState(resume);
}

class _ExperienceFieldFormState extends State<ExperienceFieldForm> {
  bool _isFormVisible = false;
  final List<Resume> _submittedDataE = [];
  List<ExperienceDetailC> experienceDetails = [];
  /*List<ExperienceDetail>? submittedData;*/

  Resume resume;
  _ExperienceFieldFormState(this.resume);


  void _toggleForm() {
    setState(() {
      _isFormVisible = !_isFormVisible;
    });
  }

  void _addExperienceDetail() {
    if (_textFieldController.text.isNotEmpty &&
        _textFieldController2.text.isNotEmpty &&
        _textFieldController3.text.isNotEmpty &&
        _textFieldController4.text.isNotEmpty) {
      setState(() {
        // Create an Experience object and add to _submittedData
        experienceDetails.add(ExperienceDetailC(
          title: _textFieldController.text,
          company: _textFieldController2.text,
          duration: _textFieldController3.text,
          description:_textFieldController4.text,
        ));
        // Clear text fields after adding data
        _textFieldController.clear();
        _textFieldController2.clear();
        _textFieldController3.clear();
        _textFieldController4.clear();
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    print(widget.resume.firstName);
    print(widget.resume.sNameT);
    String error = 'Please Enter above detail';
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 60,
              width: 330,
              child: TextButton(
                onPressed: _toggleForm,
                child: Text(
                  _isFormVisible ? 'Hide Form' : 'Show Form',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          if (_isFormVisible)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 25),
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: 'Title',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        controller: _textFieldController,
                        keyboardType: TextInputType.text,
                        cursorHeight: 35,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 25),
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: 'Company Name',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        controller: _textFieldController2,
                        keyboardType: TextInputType.text,
                        cursorHeight: 35,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 25),
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: 'Start Date - End Date',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        controller: _textFieldController3,
                        keyboardType: TextInputType.text,
                        cursorHeight: 35,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 25),
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: 'Description',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        controller: _textFieldController4,
                        keyboardType: TextInputType.text,
                        cursorHeight: 35,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, left: 20, right: 20, bottom: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 60,
                        width: 330,
                        child: TextButton(
                          onPressed: _addExperienceDetail,
                          child: const Text(
                            'Add',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                      ),
                    ),
                  ],
                ),
              ),
            ),
          ListView.separated(
            separatorBuilder: (context, index) {
              return Container(
                height: 3,
                color: Colors.black,
              );
            },
            shrinkWrap: true,
            itemCount: experienceDetails.length,
            itemBuilder: (context, index) {
              return ListTile(
                tileColor: Colors.grey.shade200,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(experienceDetails[index].title!, style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w500),),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          experienceDetails.removeAt(index);
                        });
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Company: ${experienceDetails[index].company}', style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                    Text('Duration: ${experienceDetails[index].duration}', style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                    Text('Description: ${experienceDetails[index].description}', style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 60,
              width: 330,
              child: TextButton(
                onPressed: () {
                  //
                  // print('Personal Details :--');
                  // print('id : ${widget.resume.id}');
                  // print('firstName : ${widget.resume.firstName}');
                  // print('middleName : ${widget.resume.middleName}');
                  // print('lastName : ${widget.resume.lastName}');
                  // print('jobTitle : ${widget.resume.jobTitle}');
                  // print('dob : ${widget.resume.dob}');
                  // print('gender : ${widget.resume.gender}');
                  // print('mobileNum : ${widget.resume.mobileNum}');
                  // print('email : ${widget.resume.email}');
                  // print('address : ${widget.resume.address}');
                  //
                  // print(' ');
                  //
                  // print('Educational Details :--');
                  //
                  // print('10th Detail :-');
                  // print('School Name : ${widget.resume.sNameT}');
                  // print('Passing Date : ${widget.resume.timeT}');
                  // print('Result : ${widget.resume.perT}');
                  //
                  // print('12th Detail :-');
                  // print('School Name : ${widget.resume.sNameTw}');
                  // print('Stream : ${widget.resume.streamTw}');
                  // print('Passing Date : ${widget.resume.timeTw}');
                  // print('Result : ${widget.resume.perTw}');
                  //
                  // print('Graduation Detail :-');
                  // print('Collage/Institute Name : ${widget.resume.sNameGr}');
                  // print('Degree/Course : ${widget.resume.locationGr}');
                  // print('Passing Date : ${widget.resume.timeGr}');
                  // print('Result : ${widget.resume.resultGr}');
                  //
                  // print('More Detail :-');
                  // print('Collage/Institute Name : ${widget.resume.sNameMo}');
                  // print('Degree/Course : ${widget.resume.locationMo}');
                  // print('Passing Date : ${widget.resume.timeMo}');
                  // print('Result : ${widget.resume.resultMo}');
                  if (experienceDetails.isNotEmpty) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProjectDetail.experience(widget.resume, experienceDetails),
                      ),
                    );
                  }  else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('enter details!')),
                    );
                  }
                },
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

            ),
          ),
          // Column(
          //   children: [
          //     Text('',style: TextStyle(color: Colors.red, fontSize: 25),),
          //   ],
          // )
        ],
      ),
    );
  }
}

class ExperienceDetailC {
  final String title;
  final String company;
  final String duration;
  final String description;

  const ExperienceDetailC({
    required this.title,
    required this.company,
    required this.duration,
    required this.description,
  });
}