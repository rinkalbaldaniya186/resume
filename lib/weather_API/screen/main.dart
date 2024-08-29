import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rnewapp/weather_API/model/mainC.dart';
import 'package:rnewapp/weather_API/model/response.dart';
import 'package:rnewapp/weather_API/model/sys.dart';
import 'package:rnewapp/weather_API/model/weather.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
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
  Responsee? responsee;

  bool isLoading = true;

  @override
  void initState() {
    fetchUserList();
    super.initState();
  }

  void updateLoading(bool status) {
    setState(() {
      isLoading = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: isLoading
          ? Center(
            child: CircularProgressIndicator(),
           )
          : weatherList.isNotEmpty && mainData != null
          ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://openweathermap.org/img/wn/${weatherList[0].icon}@4x.png',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Weather: ${weatherList[0].main}',
                style: TextStyle(fontSize: 25),
              ),
              Text(
                'Description: ${weatherList[0].description}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'Temperature: ${mainData?.temp}°K',
                style: TextStyle(fontSize: 25),
              ),
              Text(
                'Humidity: ${mainData?.humidity}%',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Min.Temp: ${mainData?.tempMin}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Max.Temp: ${mainData?.tempMax}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'grndLevel: ${mainData?.grndLevel}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'FeelsLike: ${mainData?.feelsLike}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'FeelsLike: ${mainData?.feelsLike}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'Country: ${sysData?.country}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Sunrise: ${sysData?.sunrise}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Sunset: ${sysData?.sunset}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'City Name: ${responsee?.name}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'id: ${responsee?.id}',
                style: TextStyle(fontSize: 18),
              ),
            ],
          )
          : Center(
             child: Text('No weather data available'),
       ),
    );
  }

  Future<void> fetchUserList() async {
    updateLoading(true);

    Response response = await get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=surat&appid=714e178a5e1c8193d4e726ced7e6e596'));

    if (response.statusCode == 200) {
      Responsee res = Responsee.fromJson(jsonDecode(response.body));

      setState(() {
        updateLoading(false);
        weatherList = res.weather ?? [];
        mainData = res.main;
        sysData = res.sys;
      });
    } else {
      updateLoading(false);
    }
  }
}


