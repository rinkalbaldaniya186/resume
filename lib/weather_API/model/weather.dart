
/// id : 701
/// main : "Mist"
/// description : "mist"
/// icon : "50d"

class Weather {
  Weather({
    num? id,
    String? main,
    String? description,
    String? icon,}){
    _id = id;
    _main = main;
    _description = description;
    _icon = icon;
  }

  Weather.fromJson(dynamic json) {
    _id = json['id'];
    _main = json['main'];
    _description = json['description'];
    _icon = json['icon'];
  }
  num? _id;
  String? _main;
  String? _description;
  String? _icon;
  Weather copyWith({  num? id,
    String? main,
    String? description,
    String? icon,
  }) => Weather(  id: id ?? _id,
    main: main ?? _main,
    description: description ?? _description,
    icon: icon ?? _icon,
  );
  num? get id => _id;
  String? get main => _main;
  String? get description => _description;
  String? get icon => _icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['main'] = _main;
    map['description'] = _description;
    map['icon'] = _icon;
    return map;
  }

}

// import 'dart:convert';
// import 'package:date_format/date_format.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:rnewapp/weather_API/model/mainC.dart';
// import 'package:rnewapp/weather_API/model/response.dart';
// import 'package:rnewapp/weather_API/model/sys.dart';
// import 'package:rnewapp/weather_API/model/weather.dart';
// import 'package:rnewapp/weather_API/model/wind.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material App',
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   List<Weather> weatherList = [];
//   Main? mainData;
//   Sys? sysData;
//   Wind? winddata;
//   Responsee? responsee;
//
//   bool isLoading = true;
//
//   TextEditingController _searchController = TextEditingController();
//
//
//   @override
//   void initState() {
//     fetchUserList();
//     super.initState();
//   }
//
//   void updateLoading(bool status) {
//     setState(() {
//       isLoading = status;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     String cityName = _searchController.text;
//
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('Weather'),
//       //   backgroundColor: Colors.lightBlueAccent,
//       // ),
//       body: isLoading
//           ? Center(
//             child: CircularProgressIndicator(),
//            )
//           : Container(
//              height: MediaQuery.sizeOf(context).height,
//              width: MediaQuery.sizeOf(context).height,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: NetworkImage("https://t3.ftcdn.net/jpg/09/27/66/52/360_F_927665268_8qlhphsRBKCi8TsIfu1LRrJ23Clpuece.jpg"),
//                 fit: BoxFit.fitHeight
//               ),
//             ),
//             child: weatherList.isNotEmpty && mainData != null
//             ? Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 25, bottom: 20, right: 20, left: 20),
//                   child: SearchBar(
//                     controller: _searchController,
//                     leading: IconButton(
//                       onPressed: () {
//                         print(cityName);
//                         'https://api.openweathermap.org/data/2.5/weather?q=${_searchController.text}&appid=97c89cf9e0f04d8a6dbf5834c72daca2';
//                       },
//                       icon: Icon(Icons.search),
//                     ),
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                      '${responsee!.name}',
//                       //  'https://api.openweathermap.org/data/2.5/weather?q=${cityName}&appid=97c89cf9e0f04d8a6dbf5834c72daca2',
//                       style: TextStyle(fontSize: 40),
//                     ),
//                     SizedBox(width: 7,),
//                     Text(
//                       '(${sysData?.country})',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                   ],
//                 ),
//                 Text(
//                   '${weatherList[0].description}',
//                   style: TextStyle(fontSize: 25),
//                 ), // weather
//                 // _dateTimeInfo(),
//                 Container(
//                   height: 180,
//                   width: 200,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: NetworkImage(
//                         'https://openweathermap.org/img/wn/${weatherList[0].icon}@4x.png',
//                       ),
//                     ),
//                   ),
//                 ),
//                 Text(
//                   '${(mainData!.temp! - 273.15).toStringAsFixed(2)}°C',
//                   style: TextStyle(fontSize: 50),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Column(
//                       children: [
//                         Text(
//                           'Min.Temp',
//                           style: TextStyle(fontSize: 18),
//                         ),
//                         Text(
//                           '${mainData?.tempMin}',
//                           style: TextStyle(fontSize: 18),
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Container(
//                       width: 3,
//                       height: 50,
//                       color: Colors.black,
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Row(
//                       children: [
//                         Column(
//                           children: [
//                             Text(
//                               'Max.Temp',
//                               style: TextStyle(fontSize: 18),
//                             ),
//                             Text(
//                               '${mainData?.tempMax}',
//                               style: TextStyle(fontSize: 18),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Column(
//                       children: [
//                         Text(
//                           'Humidity',
//                           style: TextStyle(fontSize: 18),
//                         ),
//                         Text(
//                           '${mainData?.humidity}%',
//                           style: TextStyle(fontSize: 18),
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Container(
//                       width: 3,
//                       height: 50,
//                       color: Colors.black,
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Row(
//                       children: [
//                         Column(
//                           children: [
//                             Text(
//                               'Wind Speed',
//                               style: TextStyle(fontSize: 18),
//                             ),
//                             Text(
//                               '${winddata?.speed}',
//                               style: TextStyle(fontSize: 18),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 Text(
//                   'grndLevel: ${mainData?.grndLevel}',
//                   style: TextStyle(fontSize: 18),
//                 ),
//                 Text(
//                   'FeelsLike: ${mainData?.feelsLike}',
//                   style: TextStyle(fontSize: 18),
//                 ),
//                 Text(
//                   'FeelsLike: ${mainData?.feelsLike}',
//                   style: TextStyle(fontSize: 18),
//                 ),
//                 SizedBox(height: 20),
//
//                 Text(
//                   'Sunrise: ${sysData?.sunrise}',
//                   style: TextStyle(fontSize: 18),
//                 ),
//                 Text(
//                   'Sunset: ${sysData?.sunset}',
//                   style: TextStyle(fontSize: 18),
//                 ),
//                 // Text(
//                 //   'City Name: ${responsee?.name}',
//                 //   style: TextStyle(fontSize: 18),
//                 // ),
//                 Text(
//                   'id: ${responsee?.id}',
//                   style: TextStyle(fontSize: 18),
//                 ),
//               ],
//             )
//             : Column(
//                children: [
//                  Center(
//                    child: Text(
//                      'City Name: ${responsee?.name}',
//                      style: TextStyle(fontSize: 18),
//                    ),
//                  ),
//                ],
//             ),
//           ),
//     );
//   }
//
//   Future<void> fetchUserList() async {
//     updateLoading(true);
//
//     Response response = await get(Uri.parse(
//         'https://api.openweathermap.org/data/2.5/weather?q=surat&appid=714e178a5e1c8193d4e726ced7e6e596'));
//
//     if (response.statusCode == 200) {
//       Responsee res = Responsee.fromJson(jsonDecode(response.body));
//
//       setState(() {
//         updateLoading(false);
//         weatherList = res.weather ?? [];
//         mainData = res.main;
//         sysData = res.sys;
//         winddata = res.wind;
//         responsee = res;
//       });
//     } else {
//       updateLoading(false);
//     }
//   }
// }