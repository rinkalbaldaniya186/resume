import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: animatedRotationExample(),
    );
  }
}

class animatedRotationExample extends StatefulWidget {
  const animatedRotationExample({super.key});

  @override
  State<animatedRotationExample> createState() => _animatedRotationExampleState();
}

class _animatedRotationExampleState extends State<animatedRotationExample> {

  double turns = 0.0;

  void _changeRotation() {
    setState(() {
      turns += 1.0 / 8.0;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Rotation Example',style: TextStyle(color: Colors.black, fontSize: 27),),
        backgroundColor: Colors.amber.shade400,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _changeRotation,
              child: const Text('Rotate Logo', style: TextStyle(fontSize: 25),),
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: AnimatedRotation(
                turns: turns,
                duration: const Duration(seconds: 1),
                child: FlutterLogo(
                  size: 150,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
