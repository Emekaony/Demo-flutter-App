import "package:flutter/material.dart";
import "package:flutter_app/views/widget_tree.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final bool isRunning = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          brightness: Brightness.light, // this is how u change the brightness
        ),
        appBarTheme: AppBarTheme(backgroundColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: WidgetTree(),
    );
  }
}
