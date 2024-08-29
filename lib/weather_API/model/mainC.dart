
/// temp : 302.14
/// feels_like : 307.65
/// temp_min : 302.14
/// temp_max : 302.14
/// pressure : 1001
/// humidity : 79
/// sea_level : 1001
/// grnd_level : 1000

class Main {
  Main({
    num? temp,
    num? feelsLike,
    num? tempMin,
    num? tempMax,
    num? pressure,
    num? humidity,
    num? seaLevel,
    num? grndLevel,}){
    _temp = temp;
    _feelsLike = feelsLike;
    _tempMin = tempMin;
    _tempMax = tempMax;
    _pressure = pressure;
    _humidity = humidity;
    _seaLevel = seaLevel;
    _grndLevel = grndLevel;
  }

  Main.fromJson(dynamic json) {
    _temp = json['temp'];
    _feelsLike = json['feels_like'];
    _tempMin = json['temp_min'];
    _tempMax = json['temp_max'];
    _pressure = json['pressure'];
    _humidity = json['humidity'];
    _seaLevel = json['sea_level'];
    _grndLevel = json['grnd_level'];
  }
  num? _temp;
  num? _feelsLike;
  num? _tempMin;
  num? _tempMax;
  num? _pressure;
  num? _humidity;
  num? _seaLevel;
  num? _grndLevel;
  Main copyWith({  num? temp,
    num? feelsLike,
    num? tempMin,
    num? tempMax,
    num? pressure,
    num? humidity,
    num? seaLevel,
    num? grndLevel,
  }) => Main(  temp: temp ?? _temp,
    feelsLike: feelsLike ?? _feelsLike,
    tempMin: tempMin ?? _tempMin,
    tempMax: tempMax ?? _tempMax,
    pressure: pressure ?? _pressure,
    humidity: humidity ?? _humidity,
    seaLevel: seaLevel ?? _seaLevel,
    grndLevel: grndLevel ?? _grndLevel,
  );
  num? get temp => _temp;
  num? get feelsLike => _feelsLike;
  num? get tempMin => _tempMin;
  num? get tempMax => _tempMax;
  num? get pressure => _pressure;
  num? get humidity => _humidity;
  num? get seaLevel => _seaLevel;
  num? get grndLevel => _grndLevel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = _temp;
    map['feels_like'] = _feelsLike;
    map['temp_min'] = _tempMin;
    map['temp_max'] = _tempMax;
    map['pressure'] = _pressure;
    map['humidity'] = _humidity;
    map['sea_level'] = _seaLevel;
    map['grnd_level'] = _grndLevel;
    return map;
  }

}