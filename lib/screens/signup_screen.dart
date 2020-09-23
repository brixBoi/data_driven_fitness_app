import 'package:data_driven_fitness_app/constants.dart';
import 'package:data_driven_fitness_app/custom_widgets/big_button.dart';
import 'package:flutter/material.dart';

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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: double.infinity,
                    ),
                    SignupField(label: 'First Name'),
                    Container(
                      padding: EdgeInsets.only(right: 30),
                      width: 270,
                      child: Divider(
                        color: Colors.white60,
                      ),
                    ),
                    SignupField(label: 'Last Name'),
                    Container(
                      padding: EdgeInsets.only(right: 30),
                      width: 270,
                      child: Divider(
                        color: Colors.white60,
                      ),
                    ),
                    SignupField(label: 'Email'),
                    Container(
                      padding: EdgeInsets.only(right: 30),
                      width: 270,
                      child: Divider(
                        color: Colors.white60,
                      ),
                    ),
                    SignupField(
                      label: 'Password',
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: BigButton(
                        title: 'Submit',
                        textColor: Colors.white,
                        boxDecoration:
                            BoxDecoration(gradient: Constants.kGradientLight),
                        width: 170.0,
                        height: 65.0,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignupField extends StatelessWidget {
  const SignupField({
    Key key,
    this.label,
    this.obscureText,
  }) : super(key: key);

  final String label;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 270,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: TextFormField(
          obscureText: (obscureText != null) ? obscureText : false,
          style: TextStyle(color: Colors.white, fontSize: 20),
          decoration: InputDecoration(
            border: InputBorder.none,
            labelStyle: TextStyle(color: Colors.white70),
            labelText: label,
          ),
        ),
      ),
    );
  }
}
