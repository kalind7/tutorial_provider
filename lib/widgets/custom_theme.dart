import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData customTheme() {
    return ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF00008B),
            centerTitle: false,
            titleTextStyle: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        textTheme: const TextTheme(
            titleLarge: TextStyle(
          fontSize: 20,
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        )),
        fontFamily: 'Poppins',
        iconTheme: const IconThemeData(
          color: Colors.black,
        )

        // bottomNavigationBarTheme: BottomNavigationBarThemeData(
        //   backgroundColor: Color
        // )
        );
  }
}
