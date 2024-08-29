import 'package:rnewapp/weather_API/model/clouds.dart';
import 'package:rnewapp/weather_API/model/coord.dart';
import 'package:rnewapp/weather_API/model/mainC.dart';
import 'package:rnewapp/weather_API/model/sys.dart';
import 'package:rnewapp/weather_API/model/weather.dart';
import 'package:rnewapp/weather_API/model/wind.dart';

/// coord : {"lon":72.8333,"lat":21.1667}
/// weather : [{"id":721,"main":"Haze","description":"haze","icon":"50d"}]
/// base : "stations"
/// main : {"temp":301.14,"feels_like":305.69,"temp_min":301.14,"temp_max":301.14,"pressure":1001,"humidity":83,"sea_level":1001,"grnd_level":1000}
/// visibility : 4000
/// wind : {"speed":6.69,"deg":220,"gust":11.83}
/// clouds : {"all":75}
/// dt : 1724931457
/// sys : {"type":1,"id":9071,"country":"IN","sunrise":1724892701,"sunset":1724938075}
/// timezone : 19800
/// id : 1255364
/// name : "Surat"
/// cod : 200

class Responsee {
  Responsee({
    Coord? coord,
    List<Weather>? weather,
    String? base,
    Main? main,
    num? visibility,
    Wind? wind,
    Clouds? clouds,
    num? dt,
    Sys? sys,
    num? timezone,
    num? id,
    String? name,
    num? cod,}){
    _coord = coord;
    _weather = weather;
    _base = base;
    _main = main;
    _visibility = visibility;
    _wind = wind;
    _clouds = clouds;
    _dt = dt;
    _sys = sys;
    _timezone = timezone;
    _id = id;
    _name = name;
    _cod = cod;
  }

  Responsee.fromJson(dynamic json) {
    _coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      _weather = [];
      json['weather'].forEach((v) {
        _weather?.add(Weather.fromJson(v));
      });
    }
    _base = json['base'];
    _main = json['main'] != null ? Main.fromJson(json['main']) : null;
    _visibility = json['visibility'];
    _wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    _clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    _dt = json['dt'];
    _sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    _timezone = json['timezone'];
    _id = json['id'];
    _name = json['name'];
    _cod = json['cod'];
  }
  Coord? _coord;
  List<Weather>? _weather;
  String? _base;
  Main? _main;
  num? _visibility;
  Wind? _wind;
  Clouds? _clouds;
  num? _dt;
  Sys? _sys;
  num? _timezone;
  num? _id;
  String? _name;
  num? _cod;
  Responsee copyWith({  Coord? coord,
    List<Weather>? weather,
    String? base,
    Main? main,
    num? visibility,
    Wind? wind,
    Clouds? clouds,
    num? dt,
    Sys? sys,
    num? timezone,
    num? id,
    String? name,
    num? cod,
  }) => Responsee(  coord: coord ?? _coord,
    weather: weather ?? _weather,
    base: base ?? _base,
    main: main ?? _main,
    visibility: visibility ?? _visibility,
    wind: wind ?? _wind,
    clouds: clouds ?? _clouds,
    dt: dt ?? _dt,
    sys: sys ?? _sys,
    timezone: timezone ?? _timezone,
    id: id ?? _id,
    name: name ?? _name,
    cod: cod ?? _cod,
  );
  Coord? get coord => _coord;
  List<Weather>? get weather => _weather;
  String? get base => _base;
  Main? get main => _main;
  num? get visibility => _visibility;
  Wind? get wind => _wind;
  Clouds? get clouds => _clouds;
  num? get dt => _dt;
  Sys? get sys => _sys;
  num? get timezone => _timezone;
  num? get id => _id;
  String? get name => _name;
  num? get cod => _cod;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_coord != null) {
      map['coord'] = _coord?.toJson();
    }
    if (_weather != null) {
      map['weather'] = _weather?.map((v) => v.toJson()).toList();
    }
    map['base'] = _base;
    if (_main != null) {
      map['main'] = _main?.toJson();
    }
    map['visibility'] = _visibility;
    if (_wind != null) {
      map['wind'] = _wind?.toJson();
    }
    if (_clouds != null) {
      map['clouds'] = _clouds?.toJson();
    }
    map['dt'] = _dt;
    if (_sys != null) {
      map['sys'] = _sys?.toJson();
    }
    map['timezone'] = _timezone;
    map['id'] = _id;
    map['name'] = _name;
    map['cod'] = _cod;
    return map;
  }

}








