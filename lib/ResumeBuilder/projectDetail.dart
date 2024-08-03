import 'package:flutter/material.dart';
import 'package:rnewapp/ResumeBuilder/finalPage.dart';
import 'package:rnewapp/ResumeBuilder/model/Users.dart';
import 'package:rnewapp/ResumeBuilder/model/education.dart';
import 'package:rnewapp/ResumeBuilder/model/experience.dart';
import 'package:rnewapp/ResumeBuilder/model/project.dart';
import 'package:rnewapp/ResumeBuilder/skillPage.dart';

class ProjectDetail extends StatefulWidget {
  final List<Experience> _submittedDataE;
  Education education;
  Users users;
  ProjectDetail(this._submittedDataE, this.education, this.users);

  @override
  _ProjectDetailState createState() => _ProjectDetailState(_submittedDataE,education,users);
}

class _ProjectDetailState extends State<ProjectDetail> {
  bool _isExperienceSelected = false;
  bool _isFresherSelected = false;

  List<Experience> _submittedDataE;
  Education education;
  Users users;
  _ProjectDetailState(this._submittedDataE, this.education, this.users);

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
              if (_isExperienceSelected) Flexible(child: ExperienceFieldForm(_submittedDataE, widget.education, widget.users)),
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
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => SkillPage(_submittedDataE),
                        //   ),
                        // );
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
  final List<Experience> _submittedDataE;
  Education education;
  Users users;
  ExperienceFieldForm(this._submittedDataE, this.education, this.users, {Key? key}) : super(key: key);

  @override
  _ExperienceFieldFormState createState() => _ExperienceFieldFormState();
}

class _ExperienceFieldFormState extends State<ExperienceFieldForm> {
  bool _isFormVisible = false;

  final List<Project> _submittedDataP = [];

  final TextEditingController _textFieldController = TextEditingController();
  final TextEditingController _textFieldController2 = TextEditingController();
  final TextEditingController _textFieldController3 = TextEditingController();
  final TextEditingController _textFieldController4 = TextEditingController();

  void _toggleForm() {
    setState(() {
      _isFormVisible = !_isFormVisible;
    });
  }

  void _addData() {
    if (_textFieldController.text.isNotEmpty &&
        _textFieldController2.text.isNotEmpty &&
        _textFieldController3.text.isNotEmpty &&
        _textFieldController4.text.isNotEmpty) {
      setState(() {
        _submittedDataP.add(Project(
          idpro: 1,
          pTitle: _textFieldController.text,
          pCompany: _textFieldController2.text,
          pDuration: _textFieldController3.text,
          pDescription: _textFieldController4.text,
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
                          onPressed: () {
                            _addData();
                            Project project = Project(
                              idpro: 1,
                              pTitle: _textFieldController.text,
                              pCompany: _textFieldController2.text,
                              pDuration: _textFieldController3.text,
                              pDescription: _textFieldController4.text,
                            );

                            print('add button pressed');

                          },

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
            itemCount: _submittedDataP.length,
            itemBuilder: (context, index) {
              return ListTile(
                tileColor: Colors.grey.shade200,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _submittedDataP[index].pTitle!,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _submittedDataP.removeAt(index);
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
                      'Company: ${_submittedDataP[index].pCompany}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Duration: ${_submittedDataP[index].pDuration}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Description: ${_submittedDataP[index].pDescription}',
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

                  print('Personal Details :--');
                  print('id : ${widget.users.id}');
                  print('firstName : ${widget.users.firstName}');
                  print('middleName : ${widget.users.middleName}');
                  print('lastName : ${widget.users.lastName}');
                  print('jobTitle : ${widget.users.jobTitle}');
                  print('dob : ${widget.users.dob}');
                  print('gender : ${widget.users.gender}');
                  print('mobileNum : ${widget.users.mobileNum}');
                  print('email : ${widget.users.email}');
                  print('address : ${widget.users.address}');
      
                  print(' ');
      
                  print('Educational Details :--');
      
                  print('10th Detail :-');
                  print('ide : ${widget.education.ide}');
                  print('School Name : ${widget.education.sNameT}');
                  print('Passing Date : ${widget.education.timeT}');
                  print('Result : ${widget.education.perT}');
      
                  print('12th Detail :-');
                  print('School Name : ${widget.education.sNameTw}');
                  print('Stream : ${widget.education.streamTw}');
                  print('Passing Date : ${widget.education.timeTw}');
                  print('Result : ${widget.education.perTw}');
      
                  print('Graduation Detail :-');
                  print('Collage/Institute Name : ${widget.education.sNameGr}');
                  print('Degree/Course : ${widget.education.locationGr}');
                  print('Passing Date : ${widget.education.timeGr}');
                  print('Result : ${widget.education.resultGr}');
      
                  print('More Detail :-');
                  print('Collage/Institute Name : ${widget.education.sNameMo}');
                  print('Degree/Course : ${widget.education.locationMo}');
                  print('Passing Date : ${widget.education.timeMo}');
                  print('Result : ${widget.education.resultMo}');
      
                  print(' ');
      
                  print('Experience Detail :--');
                  print('Title : ${widget._submittedDataE[0].title}');
                  print('Company Name : ${widget._submittedDataE[0].company}');
                  print('Duration : ${widget._submittedDataE[0].duration}');
                  print('Descripation : ${widget._submittedDataE[0].description}');
      
                  print('Title : ${widget._submittedDataE[1].title}');
                  print('Company Name : ${widget._submittedDataE[1].company}');
                  print('Duration : ${widget._submittedDataE[1].duration}');
                  print('Descripation : ${widget._submittedDataE[1].description}');

                  print(' ');

                  print('Project Detail :--');
                  print('Title : ${_submittedDataP[0].pTitle}');
                  print('Company Name : ${_submittedDataP[0].pCompany}');
                  print('Duration : ${_submittedDataP[0].pDuration}');
                  print('Descripation : ${_submittedDataP[0].pDescription}');

                  print('Title : ${_submittedDataP[1].pTitle}');
                  print('Company Name : ${_submittedDataP[1].pCompany}');
                  print('Duration : ${_submittedDataP[1].pDuration}');
                  print('Descripation : ${_submittedDataP[1].pDescription}');
      
                  if (_submittedDataP.isNotEmpty) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FinalPage(_submittedDataP, widget._submittedDataE, widget.education, widget.users),
                      ),
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
