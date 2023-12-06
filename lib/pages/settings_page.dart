import 'package:flutter/material.dart';
import 'package:gym_tracker/data/machines_db.dart';
import 'package:gym_tracker/data/trainings_db.dart';
import 'package:gym_tracker/utils/custom_text.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    debugPrint(machines.maschines.length.toString());
    return Row(
      children: [
        const SizedBox(width: 10),
        weekdaySettings(),
        const SizedBox(width: 15),
        Expanded(
          child: ListView.builder(
            itemCount: machines.maschines.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
                child: ListTile(
                  textColor: Colors.white,
                  iconColor: Colors.white,
                  tileColor: Colors.grey[900],
                  title: Text(machines.maschines[index].name),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Padding weekdaySettings() {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, bottom: 147),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[900],
        ),
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
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
          ),
        ),
      ),
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
      value: trainigs_db.trainigs[index].trainigsType,
      dropdownColor: Colors.grey[900],
      items: const [
        DropdownMenuItem(
            value: "Arms", child: CustomTextWithStyle(value: "Arms")),
        DropdownMenuItem(
            value: "Back", child: CustomTextWithStyle(value: "Back")),
        DropdownMenuItem(
            value: "Legs", child: CustomTextWithStyle(value: "Legs")),
        DropdownMenuItem(
            value: "Chest", child: CustomTextWithStyle(value: "Chest")),
        DropdownMenuItem(
            value: "Restday", child: CustomTextWithStyle(value: "Restday")),
        DropdownMenuItem(
            value: "Upper Body",
            child: CustomTextWithStyle(value: "Upper Body")),
        DropdownMenuItem(
            value: "Pull", child: CustomTextWithStyle(value: "Pull")),
        DropdownMenuItem(
            value: "Push", child: CustomTextWithStyle(value: "Push")),
      ],
      onChanged: (value) => {
        setState(() {
          trainigs_db.trainigs[index].trainigsType = value.toString();
        }),
        trainigs_db.updateDatabase(),
      },
    );
  }
}
