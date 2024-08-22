import 'package:rnewapp/API/model/Support.dart';
import 'package:rnewapp/API/model/User.dart';

class UserResponse {

  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<User>? userList;
  Support? support;

  UserResponse({
      this.page, 
      this.perPage, 
      this.total, 
      this.totalPages, 
      this.userList,
      this.support,});

  UserResponse.fromJson(dynamic json) {
    page = json['page'];
    perPage = json['per_page'];
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      userList = [];
      json['data'].forEach((v) {
        userList?.add(User.fromJson(v));
      });
    }
    support = json['support'] != null ? Support.fromJson(json['support']) : null;
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['per_page'] = perPage;
    map['total'] = total;
    map['total_pages'] = totalPages;
    if (userList != null) {
      map['data'] = userList?.map((v) => v.toJson()).toList();
    }
    if (support != null) {
      map['support'] = support?.toJson();
    }
    return map;
  }

}