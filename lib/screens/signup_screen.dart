import 'package:data_driven_fitness_app/constants.dart';
import 'package:data_driven_fitness_app/custom_widgets/big_button.dart';
import 'package:data_driven_fitness_app/logic/model/application_variables/ApplicationManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  static final routeName = '/signup_screen';

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Container(
      decoration: BoxDecoration(gradient: Constants.kBackgroundGradient),
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
          SignupField(
            label: 'First Name',
            keyboardType: TextInputType.name,
            regex: RXKey.name,
            errorText: 'Please enter a valid First Name',
            controller: firstNameController,
          ),
          FormDivider(),
          SignupField(
            label: 'Last Name',
            keyboardType: TextInputType.name,
            regex: RXKey.name,
            errorText: 'Please enter a valid Last Name',
            controller: lastNameController,
          ),
          FormDivider(),
          SignupField(
            label: 'Email',
            keyboardType: TextInputType.emailAddress,
            regex: RXKey.email,
            errorText: 'Please enter a valid Email',
            controller: emailController,
          ),
          FormDivider(),
          SignupField(
            label: 'Password',
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            regex: RXKey.password,
            errorText: 'Password too weak',
            controller: passwordController,
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
                BigButton(
                  title: 'Submit',
                  textColor: Colors.white,
                  boxDecoration:
                      BoxDecoration(gradient: Constants.kGradientLight),
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

class SignupField extends StatelessWidget {
  const SignupField({
    Key key,
    this.label,
    this.keyboardType,
    this.obscureText,
    @required this.errorText,
    @required this.regex,
    this.controller,
  }) : super(key: key);

  final TextInputType keyboardType;
  final String label;
  final bool obscureText;
  final String errorText;
  final String regex;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: 270,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: TextFormField(
          controller: controller,
          obscureText: (obscureText != null) ? obscureText : false,
          style: TextStyle(color: Colors.white, fontSize: 20),
          decoration: InputDecoration(
            border: InputBorder.none,
            labelStyle: TextStyle(color: Colors.white70),
            labelText: label,
            errorStyle: TextStyle(fontSize: 15, color: Colors.redAccent),
          ),
          keyboardType: keyboardType,
          validator: (value) {
            String output = null;
            if (!RegExp(regex).hasMatch(value)) {
              output = errorText;
            }
            return output;
          },
        ),
      ),
    );
  }
}
