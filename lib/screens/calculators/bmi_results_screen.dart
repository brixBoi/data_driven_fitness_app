import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'package:data_driven_fitness_app/constants.dart';
import 'bottom_container.dart';

class BMIResultsScreen extends StatelessWidget {

  //constructor to ensure all required values are passed through when called
  BMIResultsScreen({@required this.bmiResult, @required this.bmiValue, @required this.bmiDescription, @required this.bmiLevel});

  final String bmiResult;
  final String bmiValue;
  final String bmiDescription;
  final Color bmiLevel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('TDEE Results'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                'Your Results',
                style: Theme.of(context)
                    .primaryTextTheme
                    .headline3
                    .apply(color: Colors.black54),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: ReusableCard(
              colour: Theme.of(context).accentColor,
              gradient: Constants.kBackgroundGradientBlue,
              containerShape: BoxShape.rectangle,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    bmiResult,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headline3
                        .apply(color: bmiLevel, fontSizeDelta: -5,fontWeightDelta: 100),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        bmiValue,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline3
                            .apply(color: bmiLevel),
                      ),
                      SizedBox(
                        width: 1,
                      ),
                    ],
                  ),
                  Text(
                    bmiDescription,
                    style: Theme.of(context).primaryTextTheme.headline5.apply(
                        color: Theme.of(context).backgroundColor),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomContainer(
            title: 'RECALCULATE',
            gradient: Constants.kBackgroundGradientOrange,
            onTouch: (){
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
