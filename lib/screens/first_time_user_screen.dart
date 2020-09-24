import 'package:data_driven_fitness_app/constants.dart';
import 'package:data_driven_fitness_app/custom_widgets/big_button.dart';
import 'package:data_driven_fitness_app/custom_widgets/signup_field.dart';
import 'package:data_driven_fitness_app/logic/model/application_variables/ApplicationManager.dart';
import 'package:data_driven_fitness_app/logic/model/user_modelling/user_regime.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Shown if it is a users first time using the app
/// Takes user details (Height, weight, age, preferred workout program etc)
class FirstTimeUserScreen extends StatefulWidget {
  // Constant for route navigation
  static final String routeName = "/first_timeuser_screen";
  TextEditingController heightFieldontroller = TextEditingController();
  TextEditingController weightFieldontroller = TextEditingController();

  @override
  _FirstTimeUserScreenState createState() => _FirstTimeUserScreenState();
}

class _FirstTimeUserScreenState extends State<FirstTimeUserScreen> {
  GlobalKey<FormState> userFitnessForm = GlobalKey<FormState>();
  GlobalKey<CustomToggleButtonsState> userTrainTypeToggle =
      GlobalKey<CustomToggleButtonsState>();

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
                      SignupField(
                        controller: widget.heightFieldontroller,
                        label: 'Your Height (cm)',
                        keyboardType: TextInputType.number,
                        regex: RXKey.dimension,
                        errorText: 'Enter a valid height (without unit)',
                      ),
                      SignupField(
                        controller: widget.weightFieldontroller,
                        label: 'Your Weight (kg)',
                        keyboardType: TextInputType.number,
                        regex: RXKey.dimension,
                        errorText: 'Enter a valid weight (without unit)',
                      ),
                      Text('I want to...'),
                      CustomToggleButtons(
                        key: userTrainTypeToggle,
                        tiles: [
                          CustomToggleButtonTile(
                            icon: Icons.fitness_center,
                            label: 'Bulk',
                          ),
                          CustomToggleButtonTile(
                            icon: Icons.directions_run,
                            label: 'Cut',
                          ),
                          CustomToggleButtonTile(
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
                    child: BigButton(
                      boxDecoration: BoxDecoration(
                        gradient: Constants.kGradientLight,
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
                              double.parse(widget.heightFieldontroller.text),
                              double.parse(widget.weightFieldontroller.text),
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

class CustomToggleButtonTile {
  CustomToggleButtonTile({this.icon, this.label});

  final IconData icon;
  final String label;
}

class CustomToggleButtons extends StatefulWidget {
  const CustomToggleButtons({
    Key key,
    this.tiles,
  }) : super(key: key);
  final List<CustomToggleButtonTile> tiles;

  @override
  CustomToggleButtonsState createState() => CustomToggleButtonsState();
}

class CustomToggleButtonsState extends State<CustomToggleButtons> {
  final double iconSize = 40;
  final double iconPadding = 20;
  int selectedButton;
  List<CustomToggleButton> buttons = List<CustomToggleButton>();

  void initButtons() {
    buttons.clear();
    var tiles = widget.tiles;
    for (int i = 0; i < widget.tiles.length; i++) {
      CustomToggleButtonTile tile = tiles[i];
      buttons.add(
        CustomToggleButton(
          icon: tile.icon,
          label: tile.label,
          selected: i == selectedButton,
          onPressed: () {
            setState(() {
              selectedButton = i;
            });
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    initButtons();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: buttons,
    );
  }
}

class CustomToggleButton extends StatelessWidget {
  const CustomToggleButton({
    Key key,
    this.iconPadding,
    this.iconSize,
    @required this.selected,
    @required this.icon,
    this.onPressed,
    this.label,
  }) : super(key: key);

  final double iconPadding;
  final double iconSize;
  final bool selected;
  final IconData icon;
  final Function onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all((iconPadding != null) ? iconPadding : 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            iconSize: (iconSize != null) ? iconSize : 40,
            icon: Icon(
              icon,
              color: selected ? Theme.of(context).accentColor : Colors.black,
            ),
            onPressed: () => onPressed(),
          ),
          Text((label != null) ? label : ''),
        ],
      ),
    );
  }
}
