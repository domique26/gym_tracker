import 'package:flutter/material.dart';
import 'package:gym_tracker/data/database.dart';
import 'package:gym_tracker/data/machines_db.dart';
import 'package:gym_tracker/data/trainings_db.dart';
import 'package:gym_tracker/models/reps_sets_weights_model.dart';
import 'package:gym_tracker/models/training_day_model.dart';
import 'package:gym_tracker/models/workout_model.dart';
import 'package:gym_tracker/pages/compare_trainings.dart';
import 'package:gym_tracker/pages/home_page.dart';
import 'package:gym_tracker/pages/settings_page.dart';
import 'package:gym_tracker/pages/trainings_page.dart';
import 'package:gym_tracker/theme/custom_theme.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(WorkoutAdapter());
  Hive.registerAdapter(RepsSetsWeightsAdapter());
  Hive.registerAdapter(TrainingDayAdapter());

  await Hive.openBox('workouts_db');
  await Hive.openBox('trainigs_db');
  await Hive.openBox('machines_db');

  WidgetsFlutterBinding.ensureInitialized();

  var myBox = Hive.box('workouts_db');
  var myTrainigs = Hive.box('trainigs_db');
  var myMaschines = Hive.box('machines_db');

  if (myBox.get("workouts") == null) {
    db.initData();
  } else {
    db.loadData();
  }
  if (myTrainigs.get("trainigs") == null) {
    trainigs_db.initData();
  } else {
    trainigs_db.loadData();
  }
  if (myMaschines.get("machines") == null) {
    machines.initData();
  } else {
    machines.loadData();
  }

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static int _selectedIndex = 0;

  @override
  State<MyApp> createState() => _MyAppState();
}

List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
    label: "Home",
    icon: const Icon(Icons.home),
    backgroundColor: Colors.grey[900],
  ),
  BottomNavigationBarItem(
    label: "Trainings",
    icon: const Icon(Icons.calendar_month),
    backgroundColor: Colors.grey[900],
  ),
  BottomNavigationBarItem(
    label: "Compare",
    icon: const Icon(Icons.compare_arrows),
    backgroundColor: Colors.grey[900],
  ),
  BottomNavigationBarItem(
    label: "Settings",
    icon: const Icon(Icons.settings),
    backgroundColor: Colors.grey[900],
  ),
];

List pages = [
  const HomePage(),
  const TrainingsPage(),
  const CompareTrainigsPage(),
  const SettingsPage()
];

class _MyAppState extends State<MyApp> {
  _MyAppState();
  //New
  void _onItemTapped(int index) {
    setState(
      () {
        MyApp._selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "GYM TRACKER",
      /*theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 85, 84, 84),
      ),*/
      home: Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: customAppBar(),
        bottomNavigationBar: customBottomNavBar(_onItemTapped),
        body: pages[MyApp._selectedIndex],
      ),
    );
  }
}

BottomNavigationBar customBottomNavBar(onItemTapped) {
  return BottomNavigationBar(
    backgroundColor: Colors.grey[900],
    unselectedItemColor:
        themeData().bottomNavigationBarTheme.unselectedItemColor,
    selectedItemColor: themeData().bottomNavigationBarTheme.selectedItemColor,
    currentIndex: MyApp._selectedIndex, //New
    onTap: onItemTapped,
    items: items,
  );
}

AppBar customAppBar() {
  return AppBar(
    backgroundColor: themeData().appBarTheme.backgroundColor,
    centerTitle: true,
    title: const Text("GYM TRACKER"),
  );
}
