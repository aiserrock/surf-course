import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyInteractiveWidget(),
    );
  }
}

class MyInteractiveWidget extends StatefulWidget {
  const MyInteractiveWidget({super.key});

  @override
  _MyInteractiveWidgetState createState() => _MyInteractiveWidgetState();
}

class _MyInteractiveWidgetState extends State<MyInteractiveWidget> {
  double _xPosition = 0.0;
  double _yPosition = 0.0;
  double _rotation = 0.0;
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            left: _xPosition,
            top: _yPosition,
            child: Center(
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(_rotation),
                child: AnimatedContainer(
                  width: _isTapped ? 50.0 : 100.0,
                  height: _isTapped ? 50.0 : 100.0,
                  color: _isTapped ? Colors.red : Colors.blue,
                  duration: const Duration(milliseconds: 300),
                  child: const Center(
                    child: Text(
                      'Tap me!',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isTapped = !_isTapped;
                });
              },
              onPanUpdate: (details) {
                setState(() {
                  _xPosition += details.delta.dx;
                  _yPosition += details.delta.dy;
                });
              },
              onLongPress: () {
                setState(() {
                  _rotation += 0.2;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}