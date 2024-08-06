import 'package:rnewapp/ResumeBuilder/experienceDetail.dart';

class Resume {
  int? id;
  String? firstName;
  String? middleName;
  String? lastName;
  String? jobTitle; // Ensure this field exists
  String? dob;
  String? gender;
  String? mobileNum;
  String? email;
  String? address;

  String? sNameT;
  String? timeT;
  String? perT;

  String? sNameTw;
  String? streamTw;
  String? timeTw;
  String? perTw;

  String? sNameGr;
  String? locationGr;
  String? timeGr;
  String? resultGr;

  String? sNameMo;
  String? locationMo;
  String? timeMo;
  String? resultMo;

  String? title;
  String? company;
  String? duration;
  String? description;

  String? pTitle;
  String? pCompany;
  String? pDuration;
  String? pDescription;

  List<ExperienceDetailC>? submittedData;

  Resume.users(
      this.id,
      this.firstName,
      this.middleName,
      this.lastName,
      this.jobTitle,
      this.dob,
      this.gender,
      this.mobileNum,
      this.email,
      this.address);

  Resume.education(
      this.id,
      this.firstName,
      this.middleName,
      this.lastName,
      this.jobTitle,
      this.dob,
      this.gender,
      this.mobileNum,
      this.email,
      this.address,

      this.sNameT,
      this.timeT,
      this.perT,

      this.sNameTw,
      this.streamTw,
      this.timeTw,
      this.perTw,

      this.sNameGr,
      this.locationGr,
      this.timeGr,
      this.resultGr,

      this.sNameMo,
      this.locationMo,
      this.timeMo,
      this.resultMo);

  Resume.experience(
      this.id,
      this.firstName,
      this.middleName,
      this.lastName,
      this.jobTitle,
      this.dob,
      this.gender,
      this.mobileNum,
      this.email,
      this.address,

      this.sNameT,
      this.timeT,
      this.perT,

      this.sNameTw,
      this.streamTw,
      this.timeTw,
      this.perTw,

      this.sNameGr,
      this.locationGr,
      this.timeGr,
      this.resultGr,

      this.sNameMo,
      this.locationMo,
      this.timeMo,
      this.resultMo,

      this.title,
      this.company,
      this.duration,
      this.description);

  Resume.project(
      this.pTitle,
      this.pCompany,
      this.pDuration,
      this.pDescription);

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'jobtitle': jobTitle,
      'dob': dob,
      'gender': gender,
      'mobile': mobileNum,
      'email': email,
      'address': address,

      'sNameT': sNameT,
      'timeT' : timeT,
      'perT': perT,

      'sNameTw': sNameTw,
      'streamTw': streamTw,
      'timeTw' : timeTw,
      'perTw': perTw,

      'sNameGr' : sNameGr,
      'locationGr': locationGr,
      'timeGr': timeGr,
      'resultGr': resultGr,

      'sNameMo' : sNameMo,
      'locationMo': locationMo,
      'timeMo': timeMo,
      'resultMo': resultMo,

      'title': title,
      'company': company,
      'duration': duration,
      'description': description,

      'pTitle': pTitle,
      'pCompany': pCompany,
      'pDuration': pDuration,
      'pDescription': pDescription,

    };
  }
}