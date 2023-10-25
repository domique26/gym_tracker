import 'package:flutter/material.dart';
import 'package:gym_tracker/data/database.dart';
import 'package:gym_tracker/data/settings_db.dart';
import 'package:gym_tracker/main.dart';
import 'package:gym_tracker/pages/new_training_page.dart';
import 'package:gym_tracker/pages/training_detail.dart';
import 'package:gym_tracker/utils/format.dart';
import 'package:gym_tracker/models/weekdays_tile_model.dart';

import 'package:gym_tracker/models/workout_model.dart';
import 'package:hive/hive.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var myBox = Hive.box('workouts_db');
  var mySettings = Hive.box('settings_db');

  DateTime? _selectedDay;

  DateTime _focusedDay = DateTime.now();

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
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: TableCalendar(
                      headerStyle: const HeaderStyle(
                        titleTextStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: _focusedDay,
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },
                      onPageChanged: (focusedDay) {
                        _focusedDay = focusedDay;
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        Workout? w;
                        for (Workout e in db.workouts) {
                          if (e.date ==
                              '${selectedDay.day}.${selectedDay.month}.${selectedDay.year}') {
                            w = e;
                          } else {
                            w = null;
                          }
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              if (w == null) {
                                return Scaffold(
                                    appBar: customAppBar(),
                                    body: Container(
                                      color: Colors.grey[800],
                                      child: const Center(
                                        child: Text(
                                          "Empty :c",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                          ),
                                        ),
                                      ),
                                    ));
                              } else {
                                return Scaffold(
                                  body: TrainingDetail(
                                    workout: w,
                                  ),
                                );
                              }
                            },
                          ),
                        );
                      },
                      eventLoader: (day) {
                        return _getEventsForDay(day);
                      },
                      calendarBuilders: CalendarBuilders(
                        dowBuilder: (context, day) {
                          return const Center(
                            child: Text(
                              "",
                              style: TextStyle(color: Colors.red),
                            ),
                          );
                        },
                      ),
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

List _getEventsForDay(DateTime day) {
  List b = [];
  for (Workout e in db.workouts) {
    if (e.date == '${day.day}.${day.month}.${day.year}') {
      b.add(e);
    }
  }
  return b;
}
