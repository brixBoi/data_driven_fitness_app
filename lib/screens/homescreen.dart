import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  // Constant for route navigation
  static final String routeName = "/";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Home Screen",
        ),
      ),
    );
  }
}
