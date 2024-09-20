import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo App',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      debugShowCheckedModeBanner: false,
      home: const AnimatedGridScreen(),
    );
  }
}


class AnimatedGridScreen extends StatefulWidget {
  const AnimatedGridScreen({super.key});

  @override
  State<AnimatedGridScreen> createState() => _AnimatedGridScreenState();
}

class _AnimatedGridScreenState extends State<AnimatedGridScreen> {

  List<int> _gridItems = [];
// Function to add a new item to the grid
  void _addGridItem() {
    setState(() {
      // print(_gridItems.length);
      _gridItems.add(_gridItems.length);
      // print(_gridItems.length);
    });
  }

// Function to remove the last item from the grid

  void _removeGridItem() {
    if (_gridItems.isNotEmpty) {
      setState(() {
        _gridItems.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Grid"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: _gridItems.length,
                itemBuilder: (context, index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOutCirc,
                    color: Colors.blue.shade400,
                    child: Center(
                      child: Text(
                      'Item ${_gridItems[index]}',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: _addGridItem,
                  child: Icon(Icons.add),
                  tooltip: "Add Grid Item",
                ),
                FloatingActionButton(
                  onPressed: _removeGridItem,
                  child: Icon(Icons.remove),
                  tooltip: "Remove Grid Item",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
