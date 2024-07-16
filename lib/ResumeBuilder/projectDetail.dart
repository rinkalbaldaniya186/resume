import 'package:flutter/material.dart';
import 'package:rnewapp/ResumeBuilder/skillPage.dart';

class ProjectDetail extends StatefulWidget {
  const ProjectDetail({super.key});

  @override
  State<ProjectDetail> createState() => _ProjectDetailState();
}

bool _isExperienceSelected = false;
bool _isFresherSelected = false;

class _ProjectDetailState extends State<ProjectDetail> {

  void _onExperienceChanged(bool? value){
    setState(() {
      _isExperienceSelected = value!;
      if (_isFresherSelected && _isExperienceSelected) {
        _isFresherSelected = false;
      }
    });
  }

  void _onFresherChanged(bool? value){
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
        body: Padding(
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
                  const Text('Project Work',style: TextStyle(color: Colors.black,fontSize: 25, fontWeight: FontWeight.w500),),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: _isFresherSelected,
                    onChanged: _onFresherChanged,
                  ),
                  const Text('Non - Project Work',style: TextStyle(color: Colors.black,fontSize: 25, fontWeight: FontWeight.w500)),
                ],
              ),
              if(_isExperienceSelected)
                const Expanded(
                  child: ProjectFieldForm(),
                ),
              if(_isFresherSelected)
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    color: Colors.lightBlue,
                    height: 60,
                    width: 330,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SkillPage()));
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 27,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                )
            ],
          ),
        )
    );
  }
}

class ProjectFieldForm extends StatefulWidget {
  const ProjectFieldForm({super.key});

  @override
  State<ProjectFieldForm> createState() => _ProjectFieldFormState();
}

class _ProjectFieldFormState extends State<ProjectFieldForm> {
  bool _isFormVisible = false;
  final TextEditingController _textFieldController = TextEditingController();
  final TextEditingController _textFieldController2 = TextEditingController();
  final TextEditingController _textFieldController3 = TextEditingController();
  final TextEditingController _textFieldController4 = TextEditingController();
  final List<String> _submittedData = [];

  void _toggleForm() {
    setState(() {
      _isFormVisible = !_isFormVisible;
    });
  }

  void _addData() {
    if (_textFieldController.text.isNotEmpty && _textFieldController2.text.isNotEmpty && _textFieldController3.text.isNotEmpty && _textFieldController4.text.isNotEmpty) {
      setState(() {
        _submittedData.add('Company Name: ${_textFieldController.text}');
        _submittedData.add('Job-Title: ${_textFieldController2.text}');
        _submittedData.add('Duration: ${_textFieldController3.text}');
        _submittedData.add('Description: ${_textFieldController4.text}');
        _textFieldController.clear();
        _textFieldController2.clear();
        _textFieldController3.clear();
        _textFieldController4.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            color: Colors.lightBlue,
            height: 60,
            width: 330,
            child: TextButton(
              onPressed: _toggleForm,
              child: Text(_isFormVisible ? 'Hide Form' : 'Show Form',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ),
        if (_isFormVisible)
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Company Name',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  controller: _textFieldController,
                  keyboardType: TextInputType.text,
                  cursorHeight: 35,
                  style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Job Title',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  controller: _textFieldController2,
                  keyboardType: TextInputType.text,
                  cursorHeight: 35,
                  style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Start Date - End Date',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  controller: _textFieldController3,
                  keyboardType: TextInputType.text,
                  cursorHeight: 35,
                  style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  controller: _textFieldController4,
                  keyboardType: TextInputType.text,
                  cursorHeight: 35,
                  style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                color: Colors.lightBlue,
                height: 60,
                width: 330,
                child: TextButton(
                  onPressed: _addData,
                  child: const Text('Add',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.bold
                    ),),
                ),
              ),
            ],
          ),
        Flexible(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return Container(
                height: 2,
                color: Colors.black,
              );
            },
            shrinkWrap: true,
            itemCount: _submittedData.length,
            itemBuilder: (context, index) {
              return ListTile(
                tileColor: Colors.grey.shade200,
                title: Text(_submittedData[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}