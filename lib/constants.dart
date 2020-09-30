import 'package:flutter/material.dart';

class Constants {
  static final ThemeData kappLightTheme = ThemeData(
    primaryColor: Color(0xFFFFFFFF),
    backgroundColor: Color(0xFFE9EAF2),
    canvasColor: Color(0xFFF5F5F5),
    accentColor: Color(0xFF5063EE),
    primaryTextTheme: TextTheme(
        headline3: TextStyle(
          color: Colors.black,
          fontFamily: 'Questrial',
          fontSize: 45,
        ),
        headline4: TextStyle(
          color: Colors.black,
          fontFamily: 'Questrial',
          fontSize: 30,
        ),
        headline5: TextStyle(
          color: Colors.black,
          fontFamily: 'Questrial',
          fontSize: 17,
        ),
        headline6: TextStyle(
          color: Colors.black,
          fontFamily: 'Questrial',
          fontSize: 20,
        ),
        bodyText1: TextStyle()),
  );

  static final kGradientLightBlue = LinearGradient(
    colors: [
      Color(0xFF5063EE),
      Color(0xFF23253A),
    ],
  );

  static final kGradientLightOrange = LinearGradient(
    colors: [
      Color(0xFFF99543),
      Color(0xFFF28D45),
    ],
  );

  static final kBackgroundGradientBlue = LinearGradient(
//    stops: [0.1, 0.4, 0.7, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF5063EE),
      Color(0xFF23253A),
    ],
  );
  static final kBackgroundGradientOrange = LinearGradient(
//    stops: [0.1, 0.4, 0.7, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFF99543),
      Color(0xFFEF7656),
    ],
  );
  static final kBackgroundGradientGreen = LinearGradient(
//    stops: [0.1, 0.4, 0.7, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF69E6A4),
      Color(0xFF40A176),
    ],
  );
}

class RXKey {
  static const String email =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  static const String name = r'^[a-z A-Z,.\-]+$';

  static const String password =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

  static const String dimension = r'^[0-9]+(.|,|)?[0-9]$';
}
