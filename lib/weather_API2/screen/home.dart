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
    // TODO: implement initState
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
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Weather App'),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://assets.isu.pub/document-structure/221116154642-23b0c4f8d586595dea2d1bc1829eeae0/v1/57d4891c0d8f3b2464ac709bb6e6ddd6.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black, width: 3),
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            labelText: 'Location',
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w700),
                            prefixIcon: Icon(Icons.location_on_rounded,
                                color: Colors.black, size: 30),
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
                              fontSize: 20,
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
                Expanded(
                  child: FutureBuilder<Weather>(
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
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '(${weather.sys.country})',
                              style: TextStyle(fontSize: 18),
                            ),
                            if (weather.weather.isNotEmpty)
                              Container(
                                height: 150,
                                width: 200,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'https://openweathermap.org/img/wn/${weather.weather[0].icon}@4x.png'),
                                  ),
                                ),
                              ),
                            Text(
                              '${weather.main.temp}°C',
                              style: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '${weather.weather[0].description}',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 20),
                            // Additional weather information can be added here
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
                                      border: Border.all(color: Colors.black,width: 2),
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
                                            '${weather.main.tempMax}°C',
                                            style: TextStyle(
                                                fontSize: 25, fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
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
                                        ],
                                      ),
                                      border: Border.all(color: Colors.black,width: 2),
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
                                            '${weather.main.tempMin}°C',
                                            style: TextStyle(
                                                fontSize: 25, fontWeight: FontWeight.w500),
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
                                      border: Border.all(color: Colors.black,width: 2),
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
                                            '${weather.main.humidity}%',
                                            style: TextStyle(
                                                fontSize: 25, fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
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
                                      border: Border.all(color: Colors.black,width: 2),
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
                                            '${weather.wind.speed}m/s',
                                            style: TextStyle(
                                                fontSize: 25, fontWeight: FontWeight.w500),
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
                              'Feels Like: ${weather.main.feelsLike}°C',
                              style: TextStyle(fontSize: 25),
                            ),
                            Text(
                              'Air Pressure: ${weather.main.pressure}',
                              style: TextStyle(fontSize: 25),
                            ),
                            // Text(
                            //   'Humidity: ${weather.main.humidity}%',
                            //   style: TextStyle(fontSize: 25),
                            // ),
                            // Text(
                            //   'Wind Speed: ${weather.wind.speed} m/s',
                            //   style: TextStyle(fontSize: 25),
                            // ),
                          ],
                        );
                      } else {
                        return Center(child: Text('No data available'));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}