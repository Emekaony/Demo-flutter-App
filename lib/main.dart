import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Simple App"),
          backgroundColor: Colors.amber,
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Center(child: Text("Welcome to my simple Application")),
        ),
      ),
    );
  }
}
