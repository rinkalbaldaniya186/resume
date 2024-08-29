/// type : 1
/// id : 9071
/// country : "IN"
/// sunrise : 1724806284
/// sunset : 1724851727

class Sys {
  Sys({
    num? type,
    num? id,
    String? country,
    num? sunrise,
    num? sunset,}){
    _type = type;
    _id = id;
    _country = country;
    _sunrise = sunrise;
    _sunset = sunset;
  }

  Sys.fromJson(dynamic json) {
    _type = json['type'];
    _id = json['id'];
    _country = json['country'];
    _sunrise = json['sunrise'];
    _sunset = json['sunset'];
  }
  num? _type;
  num? _id;
  String? _country;
  num? _sunrise;
  num? _sunset;
  Sys copyWith({  num? type,
    num? id,
    String? country,
    num? sunrise,
    num? sunset,
  }) => Sys(  type: type ?? _type,
    id: id ?? _id,
    country: country ?? _country,
    sunrise: sunrise ?? _sunrise,
    sunset: sunset ?? _sunset,
  );
  num? get type => _type;
  num? get id => _id;
  String? get country => _country;
  num? get sunrise => _sunrise;
  num? get sunset => _sunset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['id'] = _id;
    map['country'] = _country;
    map['sunrise'] = _sunrise;
    map['sunset'] = _sunset;
    return map;
  }

}