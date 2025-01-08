import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rnewapp/weather_API2/model/weather.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    setState(() {
      _weatherFuture = fetchWeather("surat");
    });
  }

  final TextEditingController _searchController = TextEditingController();
  Future<Weather>? _weatherFuture;

  Future<Weather> fetchWeather(String cityName) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=6d1db8d0b337ac189e641dcaa3d443ab&units=metric'));

    if (response.statusCode == 200) {
      return weatherFromJson(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery for responsive design
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 3),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          labelText: 'Location',
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: width * 0.06,
                              fontWeight: FontWeight.w700),
                          prefixIcon: Icon(Icons.location_on_rounded, color: Colors.black, size: 30),
                          hintText: 'Enter city name',
                        ),
                        controller: _searchController,
                        keyboardType: TextInputType.text,
                        cursorHeight: 35,
                        onSubmitted: (value) {
                          final cityName = _searchController.text.trim();
                          if (cityName.isNotEmpty) {
                            setState(() {
                              _weatherFuture = fetchWeather(cityName);
                            });
                          }
                        },
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        final cityName = _searchController.text.trim();
                        if (cityName.isNotEmpty) {
                          setState(() {
                            _weatherFuture = fetchWeather(cityName);
                          });
                        }
                      },
                      icon: Icon(Icons.search),
                    ),
                  ],
                ),
              ),
              FutureBuilder<Weather>(
                future: _weatherFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    final weather = snapshot.data!;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${weather.name}',
                          style: TextStyle(fontSize: width * 0.1, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '(${weather.sys.country})',
                          style: TextStyle(fontSize: width * 0.05),
                        ),
                        if (weather.weather.isNotEmpty)
                          Container(
                            height: height * 0.2,
                            width: width * 0.5,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage('https://openweathermap.org/img/wn/${weather.weather[0].icon}@4x.png'),
                              ),
                            ),
                          ),
                        Text(
                          '${weather.main.temp}°C',
                          style: TextStyle(fontSize: width * 0.12, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '${weather.weather[0].description}',
                          style: TextStyle(fontSize: width * 0.07, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 20),
                        // Adjust the layout based on the orientation
                        if (orientation == Orientation.portrait) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildWeatherInfoContainer(
                                  'Max.Temp',
                                  '${weather.main.tempMax}°C',
                                  'assets/image/maxTempIcon.png',
                                  width, height),
                              SizedBox(width: 15),
                              buildWeatherInfoContainer(
                                  'Min.Temp',
                                  '${weather.main.tempMin}°C',
                                  'assets/image/minTempIcon.png',
                                  width, height),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildWeatherInfoContainer(
                                  'Humidity',
                                  '${weather.main.humidity}%',
                                  'assets/image/humidityIcon.png',
                                  width, height),
                              SizedBox(width: 15),
                              buildWeatherInfoContainer(
                                  'Wind Speed',
                                  '${weather.wind.speed}m/s',
                                  'assets/image/windSpeedIcon.png',
                                  width, height),
                            ],
                          ),
                        ] else ...[
                          // For landscape orientation, stack info horizontally
                          Column(
                            children: [
                              buildWeatherInfoContainer(
                                  'Max.Temp',
                                  '${weather.main.tempMax}°C',
                                  'assets/image/maxTempIcon.png',
                                  width, height),
                              SizedBox(height: 15),
                              buildWeatherInfoContainer(
                                  'Min.Temp',
                                  '${weather.main.tempMin}°C',
                                  'assets/image/minTempIcon.png',
                                  width, height),
                            ],
                          ),
                          SizedBox(height: 20),
                          Column(
                            children: [
                              buildWeatherInfoContainer(
                                  'Humidity',
                                  '${weather.main.humidity}%',
                                  'assets/image/humidityIcon.png',
                                  width, height),
                              SizedBox(height: 15),
                              buildWeatherInfoContainer(
                                  'Wind Speed',
                                  '${weather.wind.speed}m/s',
                                  'assets/image/windSpeedIcon.png',
                                  width, height),
                            ],
                          ),
                        ],
                        SizedBox(height: 20),
                        Text(
                          'Feels Like: ${weather.main.feelsLike}°C',
                          style: TextStyle(fontSize: width * 0.07),
                        ),
                        Text(
                          'Air Pressure: ${weather.main.pressure}',
                          style: TextStyle(fontSize: width * 0.07),
                        ),
                      ],
                    );
                  } else {
                    return Center(child: Text('No data available'));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function for weather info containers
  Widget buildWeatherInfoContainer(
      String title, String value, String iconPath, double width, double height) {
    return Container(
      height: height * 0.15,
      width: width * 0.4,
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        boxShadow: [
          BoxShadow(color: Colors.lightBlueAccent, blurRadius: 15.0),
        ],
        gradient: LinearGradient(
          colors: [
            Colors.lightBlueAccent.shade100,
            Colors.lightBlueAccent.shade200,
            Colors.lightBlueAccent.shade400,
          ],
        ),
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 80,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(iconPath)),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: width * 0.05),
              ),
              Text(
                value,
                style: TextStyle(fontSize: width * 0.06, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
