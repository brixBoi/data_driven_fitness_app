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
    ),
  );

  static final kGradientLight = LinearGradient(
    colors: [
      Color(0xFF5063EE),
      Color(0xFF23253A),
    ],
  );

  static final kGradientLightFlip = LinearGradient(
    colors: [
      Color(0xFF23253A),
      Color(0xFF5063EE),
    ],
  );

  static final kBackgroundGradient = LinearGradient(
//    stops: [0.1, 0.4, 0.7, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF5063EE),
      Color(0xFF23253A),
    ],
  );
}

class RXKey {
  static const String email =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  static const String name = r'^[a-z A-Z,.\-]+$';

  static const String password =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
}
