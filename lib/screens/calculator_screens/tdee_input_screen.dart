import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'calculator_brain.dart';
import 'tdee_results_screen.dart';
import 'package:data_driven_fitness_app/constants.dart';


class InputPage extends StatefulWidget {

  static const String routeName = "/tdee_input_screen";

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender chosenGender;
  int height = 180;
  int weight = 70;
  int age = 25;
  List<String> activityLevel = [
    'Sedentary',
    'Lightly Active',
    'Moderately Active',
    'Very Active'
  ];
  int activityLevelNumber = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('TDEE Calculator'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 8,
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onTouch: () {
                        setState(() {
                          chosenGender = Gender.male;
                        });
                      },
                      colour: chosenGender == Gender.male
                          ? Theme.of(context).accentColor
                          : inActiveCardColour,
                      gradient: chosenGender == Gender.male
                          ? Constants.kGradientLightBlue
                          : null,
                      containerShape: BoxShape.circle,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.male,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onTouch: () {
                        setState(() {
                          chosenGender = Gender.female;
                        });
                      },
                      colour: chosenGender == Gender.female
                          ? Theme.of(context).accentColor
                          : inActiveCardColour,
                      gradient: chosenGender == Gender.female
                          ? Constants.kGradientLightBlue
                          : null,
                      containerShape: BoxShape.circle,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.female,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: ReusableCard(
                colour: Theme.of(context).accentColor,
                gradient: Constants.kBackgroundGradientBlue,
                containerShape: BoxShape.rectangle,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: Theme.of(context).primaryTextTheme.headline5.apply(color: Theme.of(context).backgroundColor),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          height.toString(),
                          style: Theme.of(context).primaryTextTheme.headline4.apply(color: Theme.of(context).backgroundColor),
                        ),
                        Text(
                          'cm',
                          style: Theme.of(context).primaryTextTheme.headline5.apply(color: Theme.of(context).backgroundColor),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white70,
                        inactiveTrackColor: Colors.grey[700],
                        thumbColor: Colors.blueGrey,
                        overlayColor: Color(0x29C5CAE9),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 12.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 27),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 130,
                        max: 230,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.toInt();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: ReusableCard(
                colour: Theme.of(context).accentColor,
                gradient: Constants.kBackgroundGradientBlue,
                containerShape: BoxShape.rectangle,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'ACTIVITY LEVEL',
                      style: Theme.of(context).primaryTextTheme.headline5.apply(color: Theme.of(context).backgroundColor),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          icon: FontAwesomeIcons.arrowLeft,
                          onTouch: () {
                            setState(() {
                              (activityLevelNumber == 0)
                                  ? activityLevelNumber =
                                      activityLevel.length - 1
                                  : activityLevelNumber--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 7.5,
                        ),
                        Text(
                          activityLevel[activityLevelNumber],
                          style: Theme.of(context).primaryTextTheme.headline4.apply(color: Theme.of(context).backgroundColor),
                        ),
                        SizedBox(
                          width: 7.5,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.arrowRight,
                          onTouch: () {
                            setState(() {
                              (activityLevelNumber == activityLevel.length - 1)
                                  ? activityLevelNumber = 0
                                  : activityLevelNumber++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: Theme.of(context).accentColor,
                      gradient: Constants.kBackgroundGradientBlue,
                      containerShape: BoxShape.rectangle,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: Theme.of(context).primaryTextTheme.headline5.apply(color: Theme.of(context).backgroundColor),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                weight.toString(),
                                style: Theme.of(context).primaryTextTheme.headline4.apply(color: Theme.of(context).backgroundColor),
                              ),
                              Text(
                                'kg',
                                style: Theme.of(context).primaryTextTheme.headline5.apply(color: Theme.of(context).backgroundColor),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onTouch: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onTouch: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: Theme.of(context).accentColor,
                      gradient: Constants.kBackgroundGradientBlue,
                      containerShape: BoxShape.rectangle,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: Theme.of(context).primaryTextTheme.headline5.apply(color: Theme.of(context).backgroundColor),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                age.toString(),
                                style: Theme.of(context).primaryTextTheme.headline4.apply(color: Theme.of(context).backgroundColor),
                              ),
                              Text(
                                'yr',
                                style: Theme.of(context).primaryTextTheme.headline5.apply(color: Theme.of(context).backgroundColor),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onTouch: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onTouch: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                CalculatorBrain brain = new CalculatorBrain(
                    height: height,
                    weight: weight,
                    age: age,
                    gender: chosenGender,
                    activityLevel: activityLevelNumber);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsScreen(
                              bmrResult: brain.calculateBMR(),
                              tdeeResult: brain.calculateTDEE(),
                              tweeResult: brain.calculateTWEE(),
                            )));
              },
              child: Container(
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: Theme.of(context).primaryTextTheme.headline4.apply(color: Theme.of(context).backgroundColor),
                  ),
                ),
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: bottomContainerColour,
                  gradient: Constants.kBackgroundGradientGreen,
                ),
                width: double.infinity,
                height: bottomContainerHeight,
              ),
            )
          ],
        ));
  }
}


