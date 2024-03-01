import 'package:flutter/material.dart'; 

void main() {
  runApp(MyApp()); 
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterScreen(), // Set the home screen to CounterScreen
    );
  }
}

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0; 

  // Function to increment the counter
  void _incrementCounter() {
    setState(() {
      if (_counter < 10) {
        _counter++;
      } else {
        _showAlertDialog("Cannot Increment", "You cannot increment more.");
      }
    });
  }

  // Function to decrement the counter
  void _decrementCounter() {
    setState(() {
      if (_counter > 1) {
        _counter--;
      } else {
        _showAlertDialog("Cannot Decrement", "You cannot decrement more.");
      }
    });
  }

  // Function to show an alert dialog
  void _showAlertDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Home', // Title text
            style: TextStyle(
              fontSize: 20, // Font size
              color: Colors.white, // Font color
            ),
          ),
        ),
        backgroundColor: Colors.purple, // purple background
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button $_counter times', // Display the counter value
                ),
                Text(
                  '$_counter', // Display the counter value with larger font size
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: _decrementCounter,
                      child: Text(
                        '-', // Minus button
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple, // Purple background
                      ),
                    ),
                    SizedBox(width: 5), // Add some spacing between the buttons
                    ElevatedButton(
                      onPressed: _incrementCounter,
                      child: Text(
                        '+', // Plus button
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple, // purple background
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: _incrementCounter,
              backgroundColor: Colors.purple, // Purple background
              foregroundColor: Colors.white, // White font color
              child: Icon(Icons.add), // Plus icon
              shape: CircleBorder(), // Circular shape
            ),
          ),
        ],
      ),
    );
  }
}
