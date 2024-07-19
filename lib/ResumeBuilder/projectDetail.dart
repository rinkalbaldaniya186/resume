import 'package:flutter/material.dart';
import 'package:rnewapp/ResumeBuilder/model/experience.dart';
import 'package:rnewapp/ResumeBuilder/model/project.dart';
import 'package:rnewapp/ResumeBuilder/skillPage.dart';

class ProjectDetail extends StatefulWidget {
  const ProjectDetail({super.key});

  @override
  State<ProjectDetail> createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {
  bool _isExperienceSelected = false;
  bool _isFresherSelected = false;

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
                if (_isExperienceSelected) Flexible(child: ExperienceFieldForm()),
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
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SkillPage()));
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

class ExperienceFieldForm extends StatefulWidget {
  const ExperienceFieldForm({super.key});

  @override
  State<ExperienceFieldForm> createState() => _ExperienceFieldFormState();
}

class _ExperienceFieldFormState extends State<ExperienceFieldForm> {
  bool _isFormVisible = false;
  final TextEditingController _textFieldController = TextEditingController();
  final TextEditingController _textFieldController2 = TextEditingController();
  final TextEditingController _textFieldController3 = TextEditingController();
  final TextEditingController _textFieldController4 = TextEditingController();
  final List<ProjectClass> _submitData = []; // Changed to List<Experience>

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
        _submitData.add(ProjectClass(
          pTitle: _textFieldController.text,
          pCompany: _textFieldController2.text,
          pDuration: _textFieldController3.text,
          pDescription: _textFieldController4.text,
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
                          onPressed: _addData,
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
            itemCount: _submitData.length,
            itemBuilder: (context, index) {
              return ListTile(
                tileColor: Colors.grey.shade200,
                title: Text(
                  _submitData[index].pTitle,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Company: ${_submitData[index].pCompany}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Duration: ${_submitData[index].pDuration}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Description: ${_submitData[index].pDescription}',
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
                  if (_textFieldController.text.isNotEmpty &&
                      _textFieldController2.text.isNotEmpty &&
                      _textFieldController3.text.isNotEmpty &&
                      _textFieldController4.text.isNotEmpty) {
                       Navigator.pushReplacement(
                           context,
                           MaterialPageRoute(
                               builder: (context) => SkillPage()));
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