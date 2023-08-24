import 'package:flutter/material.dart';
import 'package:text_auto_direction/text_auto_direction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: AutoDirection(
            text: "مرحبًا بك في Flutter!",
            child: Text("مرحبًا بك في Flutter!"),
          ),
        ),
      ),
    );
  }
}
