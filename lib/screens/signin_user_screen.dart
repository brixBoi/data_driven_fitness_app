import 'package:data_driven_fitness_app/custom_widgets/signup_field.dart';
import 'package:data_driven_fitness_app/custom_widgets/stronk_custom_button.dart';
import 'package:data_driven_fitness_app/logic/model/application_variables/ApplicationManager.dart';
import 'package:data_driven_fitness_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

/// Allows user to sign in to the application
class SignInScreen extends StatefulWidget {
  static const String routeName = "/sign_in_user_screen";
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _signInformKey = GlobalKey<FormState>();
  bool _showInvalidLoginError = false;

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Container(
      decoration: BoxDecoration(
        gradient: Constants.kBackgroundGradientOrange,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 110,
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Sign in',
            style: Theme.of(context)
                .primaryTextTheme
                .headline3
                .copyWith(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: EdgeInsets.only(bottom: bottom),
            child: Form(
              key: _signInformKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 30,
                  ),
                  StronkTextFormField(
                    label: 'Email',
                    errorText: 'Please enter a valid email',
                    regex: RXKey.email,
                    textEntryColor: Colors.white,
                    labelTextColor: Colors.white70,
                    keyboardType: TextInputType.emailAddress,
                    errorTextColor: Colors.white,
                    controller: widget.emailFieldController,
                  ),
                  FormDivider(),
                  StronkTextFormField(
                    label: 'Password',
                    errorText: 'Invalid Password',
                    regex: RXKey.password,
                    textEntryColor: Colors.white,
                    labelTextColor: Colors.white70,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    errorTextColor: Colors.white,
                    controller: widget.passwordFieldController,
                  ),
                  FormDivider(),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 40, right: 20, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Visibility(
                          child: Text(
                            'Invalid email or\npassword',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                          visible: _showInvalidLoginError,
                        ),
                        StronkFlatButton(
                          title: 'Submit',
                          textColor: Colors.white,
                          boxDecoration: BoxDecoration(
                            gradient: Constants.kGradientLightOrange,
                          ),
                          width: 170.0,
                          height: 65.0,
                          onPress: () {
                            // Get the state of the current form
                            var signInForm = _signInformKey.currentState;
                            // If all fields in the form are valid
                            if (signInForm.validate()) {
                              signInForm.save();
                              // Try log the user in
                              try {
                                String email = widget.emailFieldController.text;
                                String password =
                                    widget.passwordFieldController.text;
                                Provider.of<ApplicationManager>(context).login(
                                  context,
                                  email,
                                  password,
                                );
                                // If the login is invalid
                              } catch (e) {
                                print('Invalid Login');
                                setState(() {
                                  _showInvalidLoginError = true;
                                });
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
