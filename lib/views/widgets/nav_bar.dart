import 'package:flutter/material.dart';
import "package:flutter_app/data/notifiers.dart";

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (BuildContext context, int selectedPage, _) {
        return NavigationBar(
          onDestinationSelected: (int value) {
            selectedPageNotifier.value = value;
          },
          selectedIndex: selectedPage,
          destinations: <Widget>[
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
            NavigationDestination(
              icon: Icon(Icons.schedule),
              label: "Schedule",
            ),
          ],
        );
      },
    );
  }
}
