import 'package:data_driven_fitness_app/constants.dart';
import 'package:data_driven_fitness_app/custom_widgets/signup_field.dart';
import 'package:data_driven_fitness_app/custom_widgets/stronk_custom_button.dart';
import 'package:data_driven_fitness_app/custom_widgets/stronk_toggle_buttons.dart';
import 'package:data_driven_fitness_app/logic/model/application_variables/ApplicationManager.dart';
import 'package:data_driven_fitness_app/logic/model/user_modelling/user_regime.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Shown if it is a users first time using the app
/// Takes user details (Height, weight, age, preferred workout program etc)
class FirstTimeUserScreen extends StatefulWidget {
  // Constant for route navigation
  static final String routeName = "/first_timeuser_screen";
  final TextEditingController heightFieldController = TextEditingController();
  final TextEditingController weightFieldController = TextEditingController();

  @override
  _FirstTimeUserScreenState createState() => _FirstTimeUserScreenState();
}

class _FirstTimeUserScreenState extends State<FirstTimeUserScreen> {
  GlobalKey<FormState> userFitnessForm = GlobalKey<FormState>();
  GlobalKey<StronkToggleButtonsState> userTrainTypeToggle =
      GlobalKey<StronkToggleButtonsState>();

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    bool _autoValidate = false;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          reverse: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Welcome to Stronk',
                  style: Theme.of(context).primaryTextTheme.headline4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'We need a few details from you\nbefore we can get started.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).primaryTextTheme.bodyText2,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: bottom),
                child: Form(
                  autovalidate: _autoValidate,
                  key: userFitnessForm,
                  child: Column(
                    children: [
                      StronkTextFormField(
                        controller: widget.heightFieldController,
                        label: 'Your Height (cm)',
                        keyboardType: TextInputType.number,
                        regex: RXKey.dimension,
                        errorText: 'Enter a valid height (without unit)',
                      ),
                      StronkTextFormField(
                        controller: widget.weightFieldController,
                        label: 'Your Weight (kg)',
                        keyboardType: TextInputType.number,
                        regex: RXKey.dimension,
                        errorText: 'Enter a valid weight (without unit)',
                      ),
                      Text('I want to...'),
                      StronkToggleButtons(
                        key: userTrainTypeToggle,
                        tiles: [
                          StronkToggleButtonTile(
                            icon: Icons.fitness_center,
                            label: 'Bulk',
                          ),
                          StronkToggleButtonTile(
                            icon: Icons.directions_run,
                            label: 'Cut',
                          ),
                          StronkToggleButtonTile(
                            icon: Icons.help_outline,
                            label: 'Unsure',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: StronkFlatButton(
                      boxDecoration: BoxDecoration(
                        gradient: Constants.kGradientLightBlue,
                      ),
                      textColor: Colors.white,
                      title: 'Submit',
                      onPress: () {
                        var formState = userFitnessForm.currentState;
                        var toggleState = userTrainTypeToggle.currentState;
                        if (formState.validate()) {
                          formState.save();
                          int selectedButton = toggleState.selectedButton;

                          if (selectedButton != null) {
                            UserGoals userGoal;

                            switch (selectedButton) {
                              case 0:
                                userGoal = UserGoals.BULK;
                                break;
                              case 1:
                                userGoal = UserGoals.CUT;
                                break;
                              case 2:
                                userGoal = UserGoals.BOTH;
                                break;
                            }
                            Provider.of<ApplicationManager>(context)
                                .initializeCurrentUser(
                              context,
                              int.parse(widget.heightFieldController.text),
                              int.parse(widget.weightFieldController.text),
                              userGoal,
                            );
                          } else {}
                        } else {
                          setState(() => _autoValidate = true);
                        }
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
