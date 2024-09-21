import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Flutter code sample for [AnimatedBuilder].

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:AnimatedBuilderExample(),
    );
  }
}

class AnimatedBuilderExample extends StatefulWidget {
  @override
  _AnimatedBuilderExampleState createState() => _AnimatedBuilderExampleState();
}

class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 3), // Animation duration
      vsync: this,
    );
    // Tween animation
    _animation = Tween<double>(begin: 100.0, end: 200.0).animate(_controller);
    _controller.repeat(reverse: true); // Start the animation
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedBuilder Demo'), // App bar title
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return Container(
              width: _animation.value, // Animate the width
              height: _animation.value, // Animate the height
              color: Colors.green, // Container background color
              child: Center(
                child: Text(
                  'Hello',
                  style: TextStyle(color: Colors.white, fontSize: 20), // Text color
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}