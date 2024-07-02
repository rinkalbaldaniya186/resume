class Users {
  int id;
  String firstName;
  // String middleName;
  String lastName;
  num dob;
  String gender;
  int mobile;
  String email;
  String address;

  Users(
      {required this.id,
        required this.firstName,
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
      'lastName': lastName,
      'dob': dob,
      'gender': gender,
      'mobile': mobile,
      'email': email,
      'address': address
    };
  }
}