import 'package:flutter/material.dart';
import 'package:flutter_app/data/notifiers.dart';
import 'package:flutter_app/views/pages/home.dart';
import 'package:flutter_app/views/pages/profile.dart';
import 'package:flutter_app/views/pages/schedule.dart';
import 'package:flutter_app/views/widgets/nav_bar.dart';

class WidgetTree extends StatelessWidget {
  WidgetTree({super.key});
  final List<Widget> pages = [HomePage(), ProfilePage(), SchedulePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBarWidget(),
      appBar: AppBar(
        title: Text(
          "Fakai App",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.light_mode),
          ),
        ],
        // backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, value, child) {
          return pages.elementAt(value);
        },
      ),
    );
  }
}
