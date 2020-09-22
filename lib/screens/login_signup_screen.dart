import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class LoginSignupScreen extends StatelessWidget {
  static const String routeName = "/login_signup_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Stronk", style: TextStyle()),
          SizedBox(
            width: 250,
            child: GoogleSignInButton(
              darkMode: true,
              onPressed: () {},
            ),
          ),
          FacebookSignInButton(
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
