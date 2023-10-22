import 'package:flutter/material.dart';
import 'package:gym_tracker/main.dart';
import 'package:gym_tracker/pages/new_training_page.dart';
import 'package:gym_tracker/pages/settings_page.dart';

import 'package:gym_tracker/utils/workout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static String formatTime(DateTime now) {
    String formated = '';
    if (now.hour <= 9) {
      formated += '0${now.hour}';
    } else {
      formated += '${now.hour}';
    }
    formated += ':';
    if (now.minute <= 9) {
      formated += '0${now.minute}';
    } else {
      formated += '${now.minute}';
    }

    return formated;
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    String formatWeekday(DateTime dt) {
      String wd = "";
      switch (dt.weekday) {
        case 1:
          wd = "Monday";
        case 2:
          wd = "Tuesday";
        case 3:
          wd = "Wednesday";
        case 4:
          wd = "Thursday";
        case 5:
          wd = "Friday";
        case 6:
          wd = "Saturday";
        case 7:
          wd = "Sunday";
        default:
          wd = "Erroro loool";
      }
      return wd;
    }

    String weekdayToday = formatWeekday(DateTime.now());

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
            trainigs: SettingsPage.trainigs,
            add: (index) {
              DateTime now = DateTime.now();
              setState(
                () {
                  Workout.workouts.add(
                    Workout(
                      time: HomePage.formatTime(now),
                      date: "${now.day}.${now.month}.${now.year}",
                      repsSetsWeights: [],
                    ),
                  );
                },
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Scaffold(
                      appBar: customAppBar(),
                      body: NewTrainingPage(
                        workout: Workout.workouts.last,
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
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: Text(
                      "Today is $weekdayToday!",
                      style: const TextStyle(color: Colors.white, fontSize: 35),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class WeekdaysTile extends StatelessWidget {
  const WeekdaysTile({
    super.key,
    required this.week,
    required this.trainigs,
    required this.add,
  });

  final List<String> week;
  final List<String> trainigs;
  final void Function(int) add;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        itemCount: 7,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Container(
              width: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.grey[900],
              ),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    week[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        decoration: TextDecoration.underline),
                  ),
                ),
                subtitle: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(top: 14.0),
                    child: Text(
                      trainigs[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 23.0),
                    child: addButton(trainigs, index, context),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget addButton(List<String> trainings, int index, BuildContext context) {
    if (trainigs[index] == "Restday") {
      return FilledButton(
        onPressed: null,
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            Colors.grey[800],
          ),
        ),
        child: const Text("Add"),
      );
    } else {
      return FilledButton(
        onPressed: () {
          add(index);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            Colors.deepPurple[800],
          ),
        ),
        child: const Text("Add"),
      );
    }
  }
}
