import 'package:data_driven_fitness_app/logic/model/application_variables/ApplicationManager.dart';
import 'package:data_driven_fitness_app/logic/model/application_variables/user_data.dart';
import 'package:data_driven_fitness_app/logic/model/user_modelling/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileInformationScreen extends StatefulWidget {
  static final String routeName = '/profile_information_screen';
  ProfileInformationScreen({Key key}) : super(key: key);

  @override
  _ProfileInformationScreenState createState() =>
      _ProfileInformationScreenState();
}

class _ProfileInformationScreenState extends State<ProfileInformationScreen> {
  @override
  Widget build(BuildContext context) {
    ApplicationManager appManager = Provider.of<ApplicationManager>(context);
    UserData userData = appManager.userData;
    User currentUser = userData.loggedInUser;

    final Key userEmailDisplayKey = Key('userEmailDisplay');
    final Key userIDDisplayKey = Key('userIDDisplay');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile Information"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 60,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: double.infinity),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.person,
                  size: 90,
                ),
              ),
              Text(
                currentUser.firstName + " " + currentUser.lastName,
                style: TextStyle(fontSize: 25),
              ),
              LabeledVariable(
                valueKey: userEmailDisplayKey,
                label: 'Email',
                value: currentUser.email,
              ),
              LabeledVariable(
                valueKey: userIDDisplayKey,
                label: 'User ID',
                value: "#" + currentUser.personId.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LabeledVariable extends StatelessWidget {
  const LabeledVariable({
    Key key,
    this.label,
    this.value,
    this.valueKey,
  }) : super(key: key);

  final Key valueKey;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontSize: 17, fontFamily: 'Questrial');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 40,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                label,
                style: style,
              ),
              SizedBox(
                height: 8,
                width: double.infinity,
              ),
              Text(
                value,
                key: valueKey,
                style: style.copyWith(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
