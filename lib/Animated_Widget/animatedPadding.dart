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
  double pValue = 0;

  _updatePadding(double value){
    setState(() {
      pValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Padding Example',style: TextStyle(color: Colors.black, fontSize: 27),),
        backgroundColor: Colors.amber.shade400,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _updatePadding(pValue == 0.0 ? 100.0 : 0.0);
            });
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedPadding(
                  duration: Duration(seconds: 1),
                  padding: EdgeInsets.all(pValue),
                  curve: Curves.easeInBack,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 6,
                    // color: loading ? Colors.amber.shade100 : Colors.amber.shade300,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.amber.shade100,
                        border: Border.all(color: Colors.purple.shade500, width: 2)
                    ),
                    child: Text('Hello World',style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w400),),
                  ),
                ),
                Text('Padding: $pValue', style: TextStyle(color: Colors.black, fontSize: 25),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
