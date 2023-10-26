import 'package:flutter/material.dart';
import 'package:gym_tracker/data/database.dart';
import 'package:gym_tracker/main.dart';
import 'package:gym_tracker/models/workout_model.dart';
import 'package:gym_tracker/pages/training_detail.dart';
import 'package:table_calendar/table_calendar.dart';

TextStyle ts = const TextStyle(color: Colors.white);
DateTime? _selectedDay;
DateTime _focusedDay = DateTime.now();
TableCalendar<dynamic> customTableCalendar(BuildContext context) {
  return TableCalendar(
    calendarStyle: customCalendarStyle(),
    startingDayOfWeek: StartingDayOfWeek.monday,
    headerStyle: customHeaderStyle(),
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
  );
}

CalendarStyle customCalendarStyle() {
  return CalendarStyle(
    markerMargin: const EdgeInsets.only(left: 1),
    markerDecoration: const BoxDecoration(
      color: Colors.deepPurple,
    ),
    weekNumberTextStyle: ts,
    todayTextStyle: ts,
    defaultTextStyle: ts,
    selectedTextStyle: ts,
    todayDecoration: BoxDecoration(
      color: Colors.deepPurple[800],
      borderRadius: BorderRadius.circular(100),
    ),
  );
}

HeaderStyle customHeaderStyle() {
  return const HeaderStyle(
    rightChevronIcon: Icon(
      Icons.chevron_right,
      color: Colors.white,
    ),
    leftChevronIcon: Icon(
      Icons.chevron_left,
      color: Colors.white,
    ),
    formatButtonDecoration: BoxDecoration(),
    formatButtonTextStyle: TextStyle(
      color: Colors.white,
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
    ),
  );
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
