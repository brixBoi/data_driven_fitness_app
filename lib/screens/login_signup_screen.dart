import 'package:data_driven_fitness_app/custom_widgets/big_button.dart';
import 'package:data_driven_fitness_app/logic/model/application_variables/ApplicationManager.dart';
import 'package:data_driven_fitness_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

import '../constants.dart';

class LoginSignupScreen extends StatelessWidget {
  static const String routeName = "/login_signup_screen";

  LoginSignupScreen(this.appManager);

  ApplicationManager appManager;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            left: 50.0,
            top: 30.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              AppTitle(
                titleText: 'Stronk',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      'Welcome to Stronk',
                      style: Theme.of(context).primaryTextTheme.headline4,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Text(
                  'Signup to continue',
                  style: Theme.of(context).primaryTextTheme.headline6,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          BigButton(
                            boxDecoration: BoxDecoration(
                                gradient: Constants.kGradientLight),
                            title: 'Signup',
                            textColor: Colors.white,
                            onPress: () {
                              Navigator.of(context)
                                  .pushNamed(SignupScreen.routeName);
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          BigButton(
                            boxDecoration: BoxDecoration(border: Border.all()),
                            title: 'Sign in with Social Media',
                            textColor: Theme.of(context).accentColor,
                            onPress: () {
//                              appManager.login(context);
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: Text(
                              'Already have an account?',
                              style:
                                  Theme.of(context).primaryTextTheme.headline6,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: FlatButton(
                              onPressed: () {},
                              padding: EdgeInsets.all(0),
                              child: Text(
                                'Sign in',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline5
                                    .copyWith(
                                        color: Theme.of(context).accentColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppTitle extends StatelessWidget {
  const AppTitle({
    Key key,
    this.titleText,
  }) : super(key: key);

  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: TextStyle(
            fontFamily: 'Questrial',
            fontSize: 50,
            color: Color(0xFF23253A),
          ),
        ),
        SizedBox(
          width: 155,
          child: Divider(
            thickness: 1.5,
          ),
        )
      ],
    );
  }
}

class SocialMediaLogin extends StatelessWidget {
  const SocialMediaLogin({
    Key key,
    @required this.appManager,
  }) : super(key: key);

  final ApplicationManager appManager;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 250,
          child: GoogleSignInButton(
            darkMode: true,
            onPressed: () {
              appManager.loginWithGoogle(context);
            },
          ),
        ),
        FacebookSignInButton(
          onPressed: () {
            appManager.loginWithFacebook(context);
          },
        ),
      ],
    );
  }
}

class LoginDetailsEntry extends StatelessWidget {
  const LoginDetailsEntry({
    Key key,
    this.login,
  }) : super(key: key);

  final Function login;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Please login or signup to continue'),
        ),
        Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Email'),
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Password'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: FlatButton(
                  onPressed: () {
                    login(context);
                  },
                  child: Text('Login', style: TextStyle(color: Colors.white)),
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: FlatButton(
                  onPressed: () {},
                  child: Text('Signup', style: TextStyle(color: Colors.white)),
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
