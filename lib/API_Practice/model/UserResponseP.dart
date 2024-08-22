import 'package:rnewapp/API_Practice/model/Data.dart';
import 'package:rnewapp/API_Practice/model/Support.dart';

/// page : 1
/// per_page : 6
/// total : 12
/// total_pages : 2
/// data : [{"id":1,"email":"george.bluth@reqres.in","first_name":"George","last_name":"Bluth","avatar":"https://reqres.in/img/faces/1-image.jpg"},{"id":2,"email":"janet.weaver@reqres.in","first_name":"Janet","last_name":"Weaver","avatar":"https://reqres.in/img/faces/2-image.jpg"},{"id":3,"email":"emma.wong@reqres.in","first_name":"Emma","last_name":"Wong","avatar":"https://reqres.in/img/faces/3-image.jpg"},{"id":4,"email":"eve.holt@reqres.in","first_name":"Eve","last_name":"Holt","avatar":"https://reqres.in/img/faces/4-image.jpg"},{"id":5,"email":"charles.morris@reqres.in","first_name":"Charles","last_name":"Morris","avatar":"https://reqres.in/img/faces/5-image.jpg"},{"id":6,"email":"tracey.ramos@reqres.in","first_name":"Tracey","last_name":"Ramos","avatar":"https://reqres.in/img/faces/6-image.jpg"}]
/// support : {"url":"https://reqres.in/#support-heading","text":"To keep ReqRes free, contributions towards server costs are appreciated!"}

class UserResponseP {
  UserResponseP({
      num? page, 
      num? perPage, 
      num? total, 
      num? totalPages, 
      List<Data>? usersList,
      Support? support,}){
    _page = page;
    _perPage = perPage;
    _total = total;
    _totalPages = totalPages;
    usersList = data;
    _support = support;
}

  UserResponseP.fromJson(dynamic json) {
    _page = json['page'];
    _perPage = json['per_page'];
    _total = json['total'];
    _totalPages = json['total_pages'];
    if (json['data'] != null) {
      usersList = [];
      json['data'].forEach((v) {
        usersList?.add(Data.fromJson(v));
      });
    }
    _support = json['support'] != null ? Support.fromJson(json['support']) : null;
  }
  num? _page;
  num? _perPage;
  num? _total;
  num? _totalPages;
  List<Data>? usersList;
  Support? _support;
UserResponseP copyWith({  num? page,
  num? perPage,
  num? total,
  num? totalPages,
  List<Data>? data,
  Support? support,
}) => UserResponseP(  page: page ?? _page,
  perPage: perPage ?? _perPage,
  total: total ?? _total,
  totalPages: totalPages ?? _totalPages,
  usersList: data ?? usersList,
  support: support ?? _support,
);
  num? get page => _page;
  num? get perPage => _perPage;
  num? get total => _total;
  num? get totalPages => _totalPages;
  List<Data>? get data => usersList;
  Support? get support => _support;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    map['per_page'] = _perPage;
    map['total'] = _total;
    map['total_pages'] = _totalPages;
    if (usersList != null) {
      map['data'] = usersList?.map((v) => v.toJson()).toList();
    }
    if (_support != null) {
      map['support'] = _support?.toJson();
    }
    return map;
  }

}


