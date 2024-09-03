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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://t3.ftcdn.net/jpg/09/27/66/52/360_F_927665268_8qlhphsRBKCi8TsIfu1LRrJ23Clpuece.jpg"),
            fit: BoxFit.cover,
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
      appBar: AppBar(
        title: Text('Weather App'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://t3.ftcdn.net/jpg/09/27/66/52/360_F_927665268_8qlhphsRBKCi8TsIfu1LRrJ23Clpuece.jpg"),
                fit: BoxFit.cover,
              ),
            ),
             child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter city name',
                          ),
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
              //if (responsee != null)
                Column(
                  children: [
                    Text(
                      '${responsee!.name}',
                      style: TextStyle(fontSize: 40),
                    ),
                    Text(
                      '(${sysData?.country})',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      '${weatherList.isNotEmpty ? weatherList[0].description : 'No data'}',
                      style: TextStyle(fontSize: 25),
                    ),
                    if (weatherList.isNotEmpty)
                      Container(
                        height: 180,
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
                      style: TextStyle(fontSize: 50),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Min.Temp',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              '${mainData?.tempMin ?? 'N/A'}',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Container(width: 3, height: 50, color: Colors.black),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            Text(
                              'Max.Temp',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              '${mainData?.tempMax ?? 'N/A'}',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Humidity',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            '${mainData?.humidity ?? 'N/A'}%',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Container(width: 3, height: 50, color: Colors.black),
                      SizedBox(width: 10),
                      Column(
                        children: [
                          Text(
                            'Wind Speed',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            '${windData?.speed ?? 'N/A'}',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Sunrise: ${sysData?.sunrise ?? 'N/A'}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Sunset: ${sysData?.sunset ?? 'N/A'}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'id: ${responsee?.id ?? 'N/A'}',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
                       ],
                     ),
      ),
    );
  }
}