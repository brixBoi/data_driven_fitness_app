import 'package:data_driven_fitness_app/screens/calculator_screens/bmi_results_screen.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'calculator_brain.dart';

class BMIInputScreen extends StatefulWidget {
  @override
  _BMIInputScreenState createState() => _BMIInputScreenState();
}

class _BMIInputScreenState extends State<BMIInputScreen> {
  int height = calcHeight;
  int weight = calcWeight;
  int age = calcAge;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 130.0,
        title: Center(child: Text('BMI CALCULATOR')),
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
              colour: activeCardColour,
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
                        style: textsTextStyle,
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        height.toString(),
                        style: numbersTextStyle,
                      ),
                      Text(
                        'cm',
                        style: textsTextStyle,
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
                    colour: activeCardColour,
                    containerShape: BoxShape.rectangle,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: textsTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              weight.toString(),
                              style: numbersTextStyle,
                            ),
                            Text(
                              'kg',
                              style: textsTextStyle,
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
                    colour: activeCardColour,
                    containerShape: BoxShape.rectangle,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: textsTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              age.toString(),
                              style: numbersTextStyle,
                            ),
                            Text(
                              'yr',
                              style: textsTextStyle,
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
                  weight: weight,
                  age: age,);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BMIResultsScreen(
                      )));
            },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: numbersTextStyle,
                ),
              ),
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.only(
                bottom: 10.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: bottomContainerColour,
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
