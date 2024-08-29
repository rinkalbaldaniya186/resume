
/// lon : 72.8333
/// lat : 21.1667

class Coord {
  Coord({
    num? lon,
    num? lat,}){
    _lon = lon;
    _lat = lat;
  }

  Coord.fromJson(dynamic json) {
    _lon = json['lon'];
    _lat = json['lat'];
  }
  num? _lon;
  num? _lat;
  Coord copyWith({  num? lon,
    num? lat,
  }) => Coord(  lon: lon ?? _lon,
    lat: lat ?? _lat,
  );
  num? get lon => _lon;
  num? get lat => _lat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lon'] = _lon;
    map['lat'] = _lat;
    return map;
  }

}