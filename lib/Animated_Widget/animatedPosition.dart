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

  bool isTop = true;
  bool isLeft = true;

  void _togglePosition() {
    setState(() {
      isTop = !isTop;
      isLeft = !isLeft;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Position Example',style: TextStyle(color: Colors.black, fontSize: 27),),
        backgroundColor: Colors.amber.shade400,
      ),
      body: Center(
        // child: GestureDetector(
        //   onTap: () {
        //     setState(() {
        //       isTop = !isTop;
        //       isLeft = !isLeft;
        //     });
        //   },
          child: Container(
            width: 300,
            height: 300,
            color: Colors.blue.shade500,
            child: Stack(
              children: [
                // Positioned(
                //    bottom: 10,
                //    right: 10,
                //   child: Container(
                //     height: 70,
                //     width: 150,
                //     color: Colors.lightBlueAccent,
                //   ),
                // ),
                // AnimatedPositioned(
                //   duration: Duration(seconds: 3),
                //   width: isLeft ? 250.0 : 250.0,
                //   height: isLeft ? 250.0 : 250.0,
                //   top: isTop ? 3.0 : 280.0,
                //   left: isLeft ? 7.0 : 200.0,
                //   child: isTop
                //       ? Text('Hello World',style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w400),)
                //       : Text('Wel-Come',style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),),
                // ),
                AnimatedPositioned(
                  duration: Duration(seconds: 1), // Animation duration
                  left: isLeft ? 50 : 150, // Change the left position based on the _isLeft state
                  top: 50, // Fixed top position
                  bottom: isLeft ? 150 : 50,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _togglePosition, // Call _togglePosition when pressed
        child: Icon(Icons.swap_horiz, size: 30), // Icon to display on the button
      ),
    );
  }
}
