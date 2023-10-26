import 'package:flutter/material.dart';
import 'package:gym_tracker/data/database.dart';
import 'package:gym_tracker/data/settings_db.dart';
import 'package:gym_tracker/main.dart';
import 'package:gym_tracker/pages/new_training_page.dart';
import 'package:gym_tracker/utils/custom_table_calendar.dart';
import 'package:gym_tracker/utils/format.dart';
import 'package:gym_tracker/models/weekdays_tile_model.dart';

import 'package:gym_tracker/models/workout_model.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var myBox = Hive.box('workouts_db');
  var mySettings = Hive.box('settings_db');

  @override
  void initState() {
    if (myBox.get("workouts") == null) {
      db.initData();
    } else {
      db.loadData();
    }
    if (mySettings.get("settings") == null) {
      settings_db.initData();
    } else {
      settings_db.loadData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var week = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ];

    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          WeekdaysTile(
            week: week,
            trainigs: settings_db.trainigs,
            add: (index) {
              DateTime now = DateTime.now();
              setState(
                () {
                  db.workouts.add(
                    Workout(
                      time: formatTime(now),
                      date: "${now.day}.${now.month}.${now.year}",
                      repsSetsWeights: [],
                    ),
                  );
                  db.updateDatabase();
                },
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Scaffold(
                      appBar: customAppBar(),
                      body: NewTrainingPage(
                        workout: db.workouts.last,
                      ),
                    );
                  },
                ),
              );
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: customTableCalendar(context),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
