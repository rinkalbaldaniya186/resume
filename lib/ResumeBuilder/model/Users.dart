class Users {
  int id;
  String firstName;
  String middleName;
  String lastName;
  String dob;
  String gender;
  int mobile;
  String email;
  String address;

  Users(
      {required this.id,
        required this.firstName,
        required this.middleName,
        required this.lastName,
        required this.dob,
        required this.gender,
        required this.mobile,
        required this.email,
        required this.address});

  Map<String, Object> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'dob': dob,
      'gender': gender,
      'mobile': mobile,
      'email': email,
      'address': address,
    };
  }
}