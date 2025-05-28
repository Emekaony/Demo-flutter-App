import 'package:flutter/cupertino.dart';
import "package:flutter_app/data/notifiers.dart";

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (BuildContext context, int selectedPage, _) {
        return CupertinoTabBar(
          currentIndex: selectedPage,
          onTap: (int value) {
            selectedPageNotifier.value = value;
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: "Profile",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.time),
              label: "Schedule",
            ),
          ],
        );
      },
    );
  }
}
