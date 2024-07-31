import 'package:flutter/material.dart';
import 'package:rnewapp/ResumeBuilder/model/experience.dart';
import 'package:rnewapp/ResumeBuilder/model/project.dart';
import 'package:rnewapp/ResumeBuilder/skillPage.dart';

class ProjectDetail extends StatefulWidget {
  final List<Experience> submittedData;
  ProjectDetail(this.submittedData);

  @override
  _ProjectDetailState createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {
  bool _isExperienceSelected = false;
  bool _isFresherSelected = false;
  final List<Project> _submitData = [];

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
              if (_isExperienceSelected) Flexible(child: ExperienceFieldForm(_submitData)),
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
                            builder: (context) => SkillPage(projects: _submitData),
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
      ),
    );
  }
}

class ExperienceFieldForm extends StatefulWidget {
  final List<Project> submitData;
  const ExperienceFieldForm(this.submitData, {Key? key}) : super(key: key);

  @override
  _ExperienceFieldFormState createState() => _ExperienceFieldFormState();
}

class _ExperienceFieldFormState extends State<ExperienceFieldForm> {
  bool _isFormVisible = false;
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
        widget.submitData.add(Project(
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
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 60,
          width: 330,
          child: TextButton(
            onPressed: _toggleForm,
            child: Text(
              'Add Details',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        if (_isFormVisible)
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Column(
                children: [
                  TextField(
                    controller: _textFieldController,
                    decoration: InputDecoration(
                      labelText: 'Project Title',
                    ),
                  ),
                  TextField(
                    controller: _textFieldController2,
                    decoration: InputDecoration(
                      labelText: 'Company/Organisation',
                    ),
                  ),
                  TextField(
                    controller: _textFieldController3,
                    decoration: InputDecoration(
                      labelText: 'Duration',
                    ),
                  ),
                  TextField(
                    controller: _textFieldController4,
                    decoration: InputDecoration(
                      labelText: 'Description',
                    ),
                  ),
                  Container(
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
          itemCount: widget.submitData.length,
          itemBuilder: (context, index) {
            return ListTile(
              tileColor: Colors.grey.shade200,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.submitData[index].pTitle!,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        widget.submitData.removeAt(index);
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
                    'Company: ${widget.submitData[index].pCompany}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Duration: ${widget.submitData[index].pDuration}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Description: ${widget.submitData[index].pDescription}',
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
                if (widget.submitData.isNotEmpty) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SkillPage(projects: widget.submitData),
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
    );
  }
}
