import 'dart:math' as math;
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: AnimatedBuilderEx(),
    );
  }
}

class AnimatedBuilderEx extends StatefulWidget {
  const AnimatedBuilderEx({super.key});

  @override
  State<AnimatedBuilderEx> createState() => _AnimatedBuilderExState();
}

class _AnimatedBuilderExState extends State<AnimatedBuilderEx>
    with TickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _heartbeatAnimation;

  @override
  void initState() {
    super.initState();
    // Initializing AnimationController
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    // Defining the heartbeat animation
    _heartbeatAnimation = Tween<double>(begin: 180.0, end: 160.0).animate(
      CurvedAnimation(
        curve: Curves.easeOutBack,
        parent: _animationController,
      ),
    );

    // Adding listener to repeat the animation
    _animationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });

    // Start the animation
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedBuilder Demo'), // App bar title
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (BuildContext context, Widget? child) {
            return Icon(
              Icons.favorite,
              color: Colors.blue[900],
              size: _heartbeatAnimation.value,
            );
          },
        ),
      ),
    );
  }
}