import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rnewapp/weather_API/model/mainC.dart';
import 'package:rnewapp/weather_API/model/response.dart';
import 'package:rnewapp/weather_API/model/sys.dart';
import 'package:rnewapp/weather_API/model/weather.dart';
import 'package:rnewapp/weather_API/model/wind.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    screenChange();
  }

  void screenChange(){
    Timer(Duration(seconds: 5), ()  async {
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://media.istockphoto.com/id/656116970/photo/blue-background.jpg?s=612x612&w=0&k=20&c=P7PWU0yK1Vc5y-0eexb96dCTSa7JS3fCKieY2G0dh9w="),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/weatherIcon.png"),
                fit: BoxFit.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Weather> weatherList = [];
  Main? mainData;
  Sys? sysData;
  Wind? windData;
  Responsee? responsee;

  bool isLoading = true;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchWeatherData('surat'); // Default city
  }

  void updateLoading(bool status) {
    setState(() {
      isLoading = status;
    });
  }

  Future<void> fetchWeatherData(String cityName) async {
    updateLoading(true);

    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=714e178a5e1c8193d4e726ced7e6e596'));

    if (response.statusCode == 200) {
      final res = Responsee.fromJson(jsonDecode(response.body));

      setState(() {
        updateLoading(false);
      //  List<Weather> weatherList = [];
        weatherList = res.weather ?? [];
        mainData = res.main;
        sysData = res.sys;
        windData = res.wind;
        responsee = res;
      });
    } else {
      updateLoading(false);
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Weather App'),
      //   backgroundColor: Colors.lightBlueAccent,
      // ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://media.istockphoto.com/id/656116970/photo/blue-background.jpg?s=612x612&w=0&k=20&c=P7PWU0yK1Vc5y-0eexb96dCTSa7JS3fCKieY2G0dh9w="),
                  fit: BoxFit.cover,
                ),
              ),
               child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 20, right: 20,bottom: 20),
                    child: Row(
                      children: [
                        Expanded(
                           child:
                           TextField(
                             decoration: InputDecoration(
                                 border: OutlineInputBorder(
                                   borderSide: BorderSide(color: Colors.black,width: 2),
                                   borderRadius: BorderRadius.all(Radius.circular(20)),
                                 ),
                                 labelText: 'Location',
                                 labelStyle: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700),
                                 prefixIcon: Icon(Icons.location_on_rounded, color: Colors.black, size: 30),
                                 hintText: 'Enter city name',
                             ),
                             controller: _searchController,
                             keyboardType: TextInputType.text,
                             cursorHeight: 35,
                             style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
                           ),
                        ),
                        IconButton(
                          onPressed: () {
                            final cityName = _searchController.text.trim();
                            if (cityName.isNotEmpty) {
                              fetchWeatherData(cityName);
                            }
                          },
                          icon: Icon(Icons.search),
                        ),
                      ],
                    ),
                  ),
                if (responsee != null)
                  Column(
                    children: [
                      Text(
                        '${responsee!.name}',
                        style: TextStyle(fontSize: 40,fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '(${sysData?.country})',
                        style: TextStyle(fontSize: 18),
                      ),
                      if (weatherList.isNotEmpty)
                        Container(
                          height: 150,
                          width: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://openweathermap.org/img/wn/${weatherList[0].icon}@4x.png'),
                            ),
                          ),
                        ),
                      Text(
                        '${(mainData!.temp! - 273.15).toStringAsFixed(2)}°C',
                        style: TextStyle(fontSize: 50,fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '${weatherList[0].description}',
                        style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 120,
                            width: 185,
                            decoration: BoxDecoration(
                                color: Colors.lightBlueAccent,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.lightBlueAccent,
                                  blurRadius: 15.0,
                                ),
                              ],
                              gradient: LinearGradient(
                                colors: [
                                  Colors.lightBlueAccent.shade100,
                                  Colors.lightBlueAccent.shade200,
                                  Colors.lightBlueAccent.shade400,
                                ]
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/image/maxTempIcon.png")
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Max.Temp',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      '${mainData?.tempMax ?? 'N/A'}',
                                      style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Column(
                          //   children: [
                          //     Text(
                          //       'Min.Temp',
                          //       style: TextStyle(fontSize: 18),
                          //     ),
                          //     Text(
                          //       '${mainData?.tempMin ?? 'N/A'}',
                          //       style: TextStyle(fontSize: 18),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(width: 15),
                          Container(
                            height: 120,
                            width: 185,
                            decoration: BoxDecoration(
                                color: Colors.lightBlueAccent,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.lightBlueAccent,
                                    blurRadius: 15.0,
                                  ),
                                ],
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.lightBlueAccent.shade100,
                                      Colors.lightBlueAccent.shade200,
                                      Colors.lightBlueAccent.shade400,
                                    ]
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/image/minTempIcon.png")
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Min.Temp',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      '${mainData?.tempMin ?? 'N/A'}',
                                      style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 120,
                            width: 185,
                            decoration: BoxDecoration(
                                color: Colors.lightBlueAccent,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.lightBlueAccent,
                                    blurRadius: 15.0,
                                  ),
                                ],
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.lightBlueAccent.shade100,
                                      Colors.lightBlueAccent.shade200,
                                      Colors.lightBlueAccent.shade400,
                                    ]
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/image/humidityIcon.png")
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Humidity',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      '${mainData?.humidity ?? 'N/A'}%',
                                      style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Column(
                          //   children: [
                          //     Text(
                          //       'Min.Temp',
                          //       style: TextStyle(fontSize: 18),
                          //     ),
                          //     Text(
                          //       '${mainData?.tempMin ?? 'N/A'}',
                          //       style: TextStyle(fontSize: 18),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(width: 15),
                          Container(
                            height: 120,
                            width: 185,
                            decoration: BoxDecoration(
                                color: Colors.lightBlueAccent,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.lightBlueAccent,
                                    blurRadius: 15.0,
                                  ),
                                ],
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.lightBlueAccent.shade100,
                                      Colors.lightBlueAccent.shade200,
                                      Colors.lightBlueAccent.shade400,
                                    ]
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/image/windSpeedIcon.png")
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Wind Speed',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      '${windData?.speed ?? 'N/A'}',
                                      style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    SizedBox(height: 20),
                    Text(
                      'Feels Like : ${mainData?.feelsLike ?? 'N/A'}',
                      style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400, color: Colors.black),
                    ),
                    Text(
                      'Air Pressure : ${mainData?.pressure ?? 'N/A'}',
                      style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400, color: Colors.black),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
                         ],
                       ),
                  ),
          ),
    );
  }
}