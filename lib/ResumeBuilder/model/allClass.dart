class AllClass {
  final int? id;
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
  int? perT;

  String? sNameTw;
  String? streamTw;
  String? timeTw;
  int? perTw;

  String? sNameGr;
  String? locationGr;
  String? timeGr;
  int? resultGr;

  String? sNameMo;
  String? locationMo;
  String? timeMo;
  int? resultMo;

  String? title;
  String? company;
  String? duration;
  String? description;

  String? pTitle;
  String? pCompany;
  String? pDuration;
  String? pDescription;

  AllClass.users(
      this.id,
      this.firstName,
      this.middleName,
      this.lastName,
      this.jobTitle,
      this.dob,
      this.gender,
      this.mobileNum,
      this.email,
      this.address,);

  AllClass.education(
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
      this.resultMo, this.id);

  AllClass.experience(
      this.title,
      this.company,
      this.duration,
      this.description, this.id);


  AllClass.project(
      this.pTitle,
      this.pCompany,
      this.pDuration,
      this.pDescription, this.id);

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
      'timeT': timeT,
      'perT': perT,
      'sNameTw': sNameTw,
      'streamTw': streamTw,
      'timeTw': timeTw,
      'perTw': perTw,
      'sNameGr': sNameGr,
      'locationGr': locationGr,
      'timeGr': timeGr,
      'resultGr': resultGr,
      'sNameMo': sNameMo,
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
