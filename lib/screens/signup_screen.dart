import 'package:data_driven_fitness_app/constants.dart';
import 'package:data_driven_fitness_app/custom_widgets/signup_field.dart';
import 'package:data_driven_fitness_app/custom_widgets/stronk_custom_button.dart';
import 'package:data_driven_fitness_app/logic/model/application_variables/ApplicationManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

/// Allows user to signup to the application
class SignupScreen extends StatelessWidget {
  /// Static constant for route navigation
  static final routeName = '/signup_screen';

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Container(
      decoration: BoxDecoration(gradient: Constants.kBackgroundGradientBlue),
      child: Scaffold(
        backgroundColor: Colors.transparent,
//        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          toolbarHeight: 110,
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Sign up',
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SignupForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignupForm extends StatefulWidget {
  const SignupForm({
    Key key,
  }) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool _showExistingEmailError = false;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidate: _autoValidate,
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
          ),
          StronkTextFormField(
            label: 'First Name',
            keyboardType: TextInputType.name,
            regex: RXKey.name,
            errorText: 'Please enter a valid First Name',
            controller: firstNameController,
            labelTextColor: Colors.white70,
            textEntryColor: Colors.white,
          ),
          FormDivider(),
          StronkTextFormField(
            label: 'Last Name',
            keyboardType: TextInputType.name,
            regex: RXKey.name,
            errorText: 'Please enter a valid Last Name',
            controller: lastNameController,
            labelTextColor: Colors.white70,
            textEntryColor: Colors.white,
          ),
          FormDivider(),
          StronkTextFormField(
            label: 'Email',
            keyboardType: TextInputType.emailAddress,
            regex: RXKey.email,
            errorText: 'Please enter a valid Email',
            controller: emailController,
            labelTextColor: Colors.white70,
            textEntryColor: Colors.white,
          ),
          FormDivider(),
          StronkTextFormField(
            label: 'Password',
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            regex: RXKey.password,
            errorText: 'Password too weak',
            controller: passwordController,
            labelTextColor: Colors.white70,
            textEntryColor: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  child: Text(
                    'Email already registered\n to existing user',
                    style: TextStyle(color: Colors.redAccent, fontSize: 18.0),
                  ),
                  visible: _showExistingEmailError,
                ),
                StronkFlatButton(
                  title: 'Submit',
                  textColor: Colors.white,
                  boxDecoration:
                      BoxDecoration(gradient: Constants.kGradientLightBlue),
                  width: 170.0,
                  height: 65.0,
                  onPress: () {
                    if (_formKey.currentState.validate()) {
                      ApplicationManager appManager =
                          Provider.of<ApplicationManager>(context);
                      try {
                        appManager.signup(
                          context,
                          firstNameController.text,
                          lastNameController.text,
                          emailController.text,
                          passwordController.text,
                        );
                      } catch (e) {
                        _showExistingEmailError = true;
                      }
                    } else {
                      setState(() => _autoValidate = true);
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FormDivider extends StatelessWidget {
  const FormDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 30),
      width: 270,
      child: Divider(
        color: Colors.white60,
      ),
    );
  }
}
