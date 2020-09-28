import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';

class ResultsScreen extends StatelessWidget {

  ResultsScreen({@required this.bmrResult,@required this.tdeeResult,@required this.tweeResult});

  final String bmrResult;
  final String tdeeResult;
  final String tweeResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TDEE CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                'Your Results',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ReusableCard(
              colour: activeCardColour,
              containerShape: BoxShape.rectangle,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'BMR',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        bmrResult,
                        style: numbersTextStyle.copyWith(fontSize: 35),
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Text(
                        'kcal',
                        style: numbersTextStyle.copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                  Text(
                    bmrDescription,
                    style: textsTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: ReusableCard(
              colour: activeCardColour,
              containerShape: BoxShape.rectangle,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'TDEE',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 28,
                        fontWeight: FontWeight.w500),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        tdeeResult,
                        style: numbersTextStyle.copyWith(fontSize: 35),
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Text(
                        'kcal',
                        style: numbersTextStyle.copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                  Text(
                    tdeeDescription,
                    style: textsTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ReusableCard(
              colour: activeCardColour,
              containerShape: BoxShape.rectangle,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'TWEE',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        tweeResult,
                        style: numbersTextStyle.copyWith(fontSize: 35),
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Text(
                        'kcal',
                        style: numbersTextStyle.copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                  Text(
                    tweeDescription,
                    style: textsTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  'RESET',
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
