import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  static var trainigs = [
    "Restday",
    "Chest",
    "Legs",
    "Restday",
    "Arms",
    "Restday",
    "Back"
  ];

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customText("Monday"),
        customDropDown(0),
        customText("Tuesday"),
        customDropDown(1),
        customText("Wednesday"),
        customDropDown(2),
        customText("Thursday"),
        customDropDown(3),
        customText("Friday"),
        customDropDown(4),
        customText("Saturday"),
        customDropDown(5),
        customText("Sunday"),
        customDropDown(6),
      ],
    );
  }

  Text customText(String weekday) {
    return Text(
      weekday,
      style: const TextStyle(color: Colors.white),
    );
  }

  DropdownButton<String> customDropDown(int index) {
    return DropdownButton(
      value: SettingsPage.trainigs[index],
      items: const [
        DropdownMenuItem(value: "Arms", child: Text("Arms")),
        DropdownMenuItem(value: "Back", child: Text("Back")),
        DropdownMenuItem(value: "Legs", child: Text("Legs")),
        DropdownMenuItem(value: "Chest", child: Text("Chest")),
        DropdownMenuItem(value: "Restday", child: Text("Restday")),
      ],
      onChanged: (value) => {
        setState(() {
          SettingsPage.trainigs[index] = value.toString();
        })
      },
    );
  }
}
