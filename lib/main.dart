import "package:flutter/material.dart";
import "package:flutter_app/painter.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final bool isRunning = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WhiteboardPage(),
    );
  }
}
