import 'package:data_driven_fitness_app/screens/calculator_screens/bmi_results_screen.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'calculator_brain.dart';
import 'package:data_driven_fitness_app/constants.dart';

class BMIInputScreen extends StatefulWidget {

  static const String routeName = "/bmi_input_screen";

  @override
  _BMIInputScreenState createState() => _BMIInputScreenState();
}

class _BMIInputScreenState extends State<BMIInputScreen> {
  int height = 180;
  int weight = 70;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            width: double.infinity, height: 30,
          ),
          Expanded(
            flex: 2,
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
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 27),
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
            flex: 3,
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
                        SizedBox(height: 10.0,),
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
                        SizedBox(height: 10.0,),
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
          SizedBox(
            width: double.infinity, height: 200,
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain brain = new CalculatorBrain(
                  height: height,
                  weight: weight,);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BMIResultsScreen(
                        bmiValue: brain.calculateBMI(),
                        bmiResult: brain.getBMICategory(),
                        bmiDescription: brain.getBMIExplanation(),
                        bmiLevel: brain.getBMIColour(),
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
      ),
    );
  }
}
