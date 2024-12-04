import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  void buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "*") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Already contains a decimal");
        return;
      } else {
        _output += buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      switch (operand) {
        case "+":
          _output = (num1 + num2).toString();
          break;
        case "-":
          _output = (num1 - num2).toString();
          break;
        case "*":
          _output = (num1 * num2).toString();
          break;
        case "/":
          _output = (num1 / num2).toString();
          break;
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output == "0" ? buttonText : _output + buttonText;
    }

    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText, Color color, {double? height}) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(4), // Add margin for spacing
        height: height, // Set height for CLEAR and =
        child: AspectRatio(
          aspectRatio: 1.0, // Make other buttons square
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: color, // Set the background color
              // primary: Colors.white, // Set the text color
              side: BorderSide(color: Colors.black87, width: 2), // Dark border
              elevation: 50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0), // Rounded corners if desired
              ),
            ),
            child: Text(
              buttonText,
              style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
            ),
            onPressed: () => buttonPressed(buttonText),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2), // Set border color and width
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                  color: Colors.grey.shade200, // Background color
                ),
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                child: Text(
                  output,
                  style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              child: Column(children: [
                Row(children: [
                  buildButton("7", Colors.red),
                  buildButton("8", Colors.orange),
                  buildButton("9", Colors.yellow),
                  buildButton("/", Colors.green),
                ]),
                Row(children: [
                  buildButton("4", Colors.blue),
                  buildButton("5", Colors.purple),
                  buildButton("6", Colors.teal),
                  buildButton("*", Colors.indigo),
                ]),
                Row(children: [
                  buildButton("1", Colors.cyan),
                  buildButton("2", Colors.lime),
                  buildButton("3", Colors.pink),
                  buildButton("-", Colors.brown),
                ]),
                Row(children: [
                  buildButton(".", Colors.grey),
                  buildButton("0", Colors.amber),
                  buildButton("00", Colors.deepOrange),
                  buildButton("+", Colors.blueAccent),
                ]),
                Row(children: [
                  buildButton("CLEAR", Colors.redAccent, height: 80), // Shorter height
                  buildButton("=", Colors.greenAccent.shade200, height: 80), // Shorter height
                ])
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
