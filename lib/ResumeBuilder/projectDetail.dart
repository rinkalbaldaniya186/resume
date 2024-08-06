import 'package:flutter/material.dart';
import 'package:rnewapp/ResumeBuilder/finalPage.dart';
import 'package:rnewapp/ResumeBuilder/model/Users.dart';
import 'package:rnewapp/ResumeBuilder/model/education.dart';
import 'package:rnewapp/ResumeBuilder/model/experience.dart';
import 'package:rnewapp/ResumeBuilder/model/project.dart';
import 'package:rnewapp/ResumeBuilder/skillPage.dart';

import 'model/allClass.dart';

class ProjectDetail extends StatefulWidget {

  final Resume resume;
  late List experienceDetails = [];

   ProjectDetail.experience(this.resume, this.experienceDetails);
   ProjectDetail({super.key, required this.resume});
  ProjectDetail.fresher(this.resume);


@override
  _ProjectDetailState createState() => _ProjectDetailState(resume,experienceDetails);
  // ProjectDetail.fresher(this.resume);
}

class _ProjectDetailState extends State<ProjectDetail> {
  bool _isExperienceSelected = false;
  bool _isFresherSelected = false;

  Resume resume;
  late List experienceDetails = [];
  _ProjectDetailState(this.resume, this.experienceDetails);


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
    print(widget.experienceDetails.length);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Project Detail',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: Colors.blue.shade400,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: NetworkImage(
                'https://img.freepik.com/premium-vector/hand-painted-watercolor-abstract-background_889452-17399.jpg'),
          ),
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
                    'Project',
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
                  const Text('Non - Project',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500)),
                ],
              ),
              if (_isExperienceSelected) Flexible(child: ExperienceFieldForm(resume,experienceDetails)),
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
                              builder: (context) => SkillPage.fresher(
                                  widget.resume, widget.experienceDetails)),
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
      ),
    );
  }
}

class ExperienceFieldForm extends StatefulWidget {

  Resume resume;
  late List experienceDetails = [];
  ExperienceFieldForm(this.resume, this.experienceDetails);


  @override
  _ExperienceFieldFormState createState() => _ExperienceFieldFormState(resume,experienceDetails);
}

class _ExperienceFieldFormState extends State<ExperienceFieldForm> {
  bool _isFormVisible = false;

  final List<Resume> _submittedDataP = [];

  final TextEditingController _textFieldController = TextEditingController();
  final TextEditingController _textFieldController2 = TextEditingController();
  final TextEditingController _textFieldController3 = TextEditingController();
  final TextEditingController _textFieldController4 = TextEditingController();

  List ProjectDetails = [];

  Resume resume;
  late List experienceDetails = [];
  _ExperienceFieldFormState(this.resume, this.experienceDetails);

  void _toggleForm() {
    setState(() {
      _isFormVisible = !_isFormVisible;
    });
  }

  void _addProjectDetail() {
    if (_textFieldController.text.isNotEmpty &&
        _textFieldController2.text.isNotEmpty &&
        _textFieldController3.text.isNotEmpty &&
        _textFieldController4.text.isNotEmpty) {
      setState(() {
        ProjectDetails.add(ProjectDetailC(
          title: _textFieldController.text,
          company: _textFieldController2.text,
          typeofproject: _textFieldController3.text,
          description: _textFieldController4.text,
        ));
      });
    }
    _toggleForm();
    _textFieldController.clear();
    _textFieldController2.clear();
    _textFieldController3.clear();
    _textFieldController4.clear();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.resume.firstName);
    print(widget.resume.sNameT);
    print(widget.experienceDetails.length);
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
                        child:TextButton(
                          onPressed: _addProjectDetail,
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
            itemCount: ProjectDetails.length,
            itemBuilder: (context, index) {
              return ListTile(
                tileColor: Colors.grey.shade200,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ProjectDetails[index].title!,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          ProjectDetails.removeAt(index);
                        });
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Company: ${ProjectDetails[index].company}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Duration: ${ProjectDetails[index].typeofproject}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Description: ${ProjectDetails[index].description}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
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
                //   print('Personal Details :--');
                //   print('id : ${widget.resume.id}');
                //   print('firstName : ${widget.resume.firstName}');
                //   print('middleName : ${widget.resume.middleName}');
                //   print('lastName : ${widget.resume.lastName}');
                //   print('jobTitle : ${widget.resume.jobTitle}');
                //   print('dob : ${widget.resume.dob}');
                //   print('gender : ${widget.resume.gender}');
                //   print('mobileNum : ${widget.resume.mobileNum}');
                //   print('email : ${widget.resume.email}');
                //   print('address : ${widget.resume.address}');
                //
                //   print(' ');
                //
                //   print('Educational Details :--');
                //
                //   print('10th Detail :-');
                // 3
                //   print('School Name : ${widget.resume.sNameT}');
                //   print('Passing Date : ${widget.resume.timeT}');
                //   print('Result : ${widget.resume.perT}');
                //
                //   print('12th Detail :-');
                //   print('School Name : ${widget.resume.sNameTw}');
                //   print('Stream : ${widget.resume.streamTw}');
                //   print('Passing Date : ${widget.resume.timeTw}');
                //   print('Result : ${widget.resume.perTw}');
                //
                //   print('Graduation Detail :-');
                //   print('Collage/Institute Name : ${widget.resume.sNameGr}');
                //   print('Degree/Course : ${widget.resume.locationGr}');
                //   print('Passing Date : ${widget.resume.timeGr}');
                //   print('Result : ${widget.resume.resultGr}');
                //
                //   print('More Detail :-');
                //   print('Collage/Institute Name : ${widget.resume.sNameMo}');
                //   print('Degree/Course : ${widget.resume.locationMo}');
                //   print('Passing Date : ${widget.resume.timeMo}');
                //   print('Result : ${widget.resume.resultMo}');
                //
                //   print(' ');
                //
                //   print('Experience Detail :--');
                //   print('Title : ${widget.resume.title}');
                //   print('Company Name : ${widget.resume.company}');
                //   print('Duration : ${widget.resume.duration}');
                //   print('Descripation : ${widget.resume.description}');
                //
                //   print('Title : ${widget.resume.title}');
                //   print('Company Name : ${widget.resume.company}');
                //   print('Duration : ${widget.resume.duration}');
                //   print('Descripation : ${widget.resume.description}');
                //
                //   print(' ');
                //
                //   print('Project Detail :--');
                //   print('Title : ${resume.pTitle}');
                //   print('Company Name : ${resume.pCompany}');
                //   print('Duration : ${resume.pDuration}');
                //   print('Descripation : ${resume.pDescription}');
                //
                //   print('Title : ${resume.pTitle}');
                //   print('Company Name : ${resume.pCompany}');
                //   print('Duration : ${resume.pDuration}');
                //   print('Descripation : ${resume.pDescription}');
                  if (ProjectDetails.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SkillPage(widget.resume, ProjectDetails, widget.experienceDetails)),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please add at least one project')),
                    );
                  }
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
    );
  }
}


class ProjectDetailC {
  final String title;
  final String company;
  final String typeofproject;
  final String description;

  const ProjectDetailC({
    required this.title,
    required this.company,
    required this.typeofproject,
    required this.description,
  });
}