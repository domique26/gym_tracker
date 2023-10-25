import 'package:flutter/material.dart';

ThemeData themeData() {
  return ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[900],
    ),
    primaryColor: Colors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey[900],
      selectedItemColor: Colors.deepPurple[800],
      unselectedItemColor: Colors.grey[400],
    ),
  );
}
