import 'package:flutter/material.dart';
import 'package:gym_tracker/utils/workout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String formatTime(DateTime now) {
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
    var trainigs = [
      "Restday",
      "Chest",
      "Legs",
      "Restday",
      "Arms",
      "Restday",
      "Back"
    ];
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          WeekdaysTile(
            week: week,
            trainigs: trainigs,
            add: (index) {
              DateTime now = DateTime.now();
              setState(
                () {
                  Workout.workouts.add(
                    /*[
                      '${week[index]}   |   ${now.day}.${now.month}.${now.year}   |   ${formatTime(now)}',
                      trainigs[index],
                      60
                    ],*/

                    RepsSetsWeights(
                        reps: 6,
                        sets: 4,
                        weight: 50,
                        exercise: "Dips",
                        date: "${now.day}.${now.month}.${now.year}",
                        time: formatTime(now)),
                  );
                },
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(25)),
              width: MediaQuery.of(context).size.width,
              height: 469.4,
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
                    child: AddButton(trainigs, index),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget AddButton(List<String> trainings, int index) {
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
