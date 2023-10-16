import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GestureDetectorExample(),
    );
  }
}

class GestureDetectorExample extends StatefulWidget {
  @override
  _GestureDetectorExampleState createState() => _GestureDetectorExampleState();
}

class _GestureDetectorExampleState extends State<GestureDetectorExample> {
  String _gestureDetected = '';

  void _handleTap() {
    setState(() {
      _gestureDetected = 'Tap';
    });
  }

  void _handleDoubleTap() {
    setState(() {
      _gestureDetected = 'Double Tap';
    });
  }

  void _handleLongPress() {
    setState(() {
      _gestureDetected = 'Long Press';
    });
  }

  void _handleHorizontalSwipe(DragEndDetails details) {
    setState(() {
      _gestureDetected = 'Horizontal Swipe';
    });
  }

  void _handleVerticalSwipe(DragEndDetails details) {
    setState(() {
      _gestureDetected = 'Vertical Swipe';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GestureDetector Example'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _handleTap,
          onDoubleTap: _handleDoubleTap,
          onLongPress: _handleLongPress,
          onHorizontalDragEnd: _handleHorizontalSwipe,
          onVerticalDragEnd: _handleVerticalSwipe,
          child: Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Text(
                'Gesture Detected: $_gestureDetected',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
