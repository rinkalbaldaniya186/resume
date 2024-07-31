class Users {
  int id;
  String firstName;
  String middleName;
  String lastName;
  String jobTitle; // Ensure this field exists
  String dob;
  String gender;
  String mobileNum;
  String email;
  String address;

  Users({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.jobTitle,
    required this.dob,
    required this.gender,
    required this.mobileNum,
    required this.email,
    required this.address,
  });


Map<String, Object> toMap() {
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
    };
  }
}
