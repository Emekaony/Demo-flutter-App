import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController controller = TextEditingController();
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          CupertinoButton(child: Text("iOS-style button"), onPressed: () {}),
          CupertinoSwitch(
            value: switchValue,
            onChanged: (bool val) {
              setState(() {
                switchValue = val;
              });
            },
          ),
          Text("Switch value is: $switchValue"),
        ],
      ),
    );
  }
}
