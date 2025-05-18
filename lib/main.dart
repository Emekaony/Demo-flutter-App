import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final bool isRunning = false;

  int _selectedIndex = 0;

  void handleDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark, // this is how u change the brightness
        ),
        appBarTheme: AppBarTheme(backgroundColor: Colors.deepPurple),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.deepPurple,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: handleDestinationSelected,
          selectedIndex: _selectedIndex,
          destinations: <Widget>[
            NavigationDestination(icon: Icon(Icons.explore), label: "Explore"),
            NavigationDestination(
              icon: Icon(Icons.party_mode),
              label: "Events",
            ),
            NavigationDestination(
              icon: Icon(Icons.access_alarm),
              label: "Schedule",
            ),
          ],
        ),
        appBar: AppBar(
          title: Text(
            "Fakai App",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          // backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Center(
            child: Row(
              children: [
                TextButton(
                  onPressed: () => {},
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      "RESET",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 10),
                ClipOval(
                  child: Image.asset(
                    'assets/images/image_one.jpg',
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover, // ensures it fills the oval
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
