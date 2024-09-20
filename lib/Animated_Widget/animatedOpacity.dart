import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool loading = true;
  double oValue = 0;

  _updatePadding(double value){
    setState(() {
      oValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Opecity Example',style: TextStyle(color: Colors.black, fontSize: 27),),
        backgroundColor: Colors.amber.shade400,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _updatePadding(oValue == 0.0 ? 1.0 : 0.0);
            });
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.lightBlue.shade100,
                  child: AnimatedOpacity(
                    duration: Duration(seconds: 3),
                    opacity: oValue,
                    child: FlutterLogo(
                        size: 200
                      ),
                  ),
                ),
                Text('Opacity: $oValue', style: TextStyle(color: Colors.black, fontSize: 25),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
