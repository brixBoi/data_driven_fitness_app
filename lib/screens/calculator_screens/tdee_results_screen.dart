import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'package:data_driven_fitness_app/constants.dart';

class ResultsScreen extends StatelessWidget {

  ResultsScreen({@required this.bmrResult,@required this.tdeeResult,@required this.tweeResult});

  final String bmrResult;
  final String tdeeResult;
  final String tweeResult;

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
                style: Theme.of(context).primaryTextTheme.headline3.apply(color: Colors.black54),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ReusableCard(
              colour: Theme.of(context).accentColor,
              gradient: Constants.kBackgroundGradientBlue,
              containerShape: BoxShape.rectangle,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'BMR',
                    style: Theme.of(context).primaryTextTheme.headline4.apply(color: Theme.of(context).backgroundColor),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        bmrResult,
                        style: Theme.of(context).primaryTextTheme.headline4.apply(color: Colors.tealAccent, fontSizeDelta: 6),
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Text(
                        'kcal',
                        style: Theme.of(context).primaryTextTheme.headline5.apply(color: Theme.of(context).backgroundColor),
                      ),
                    ],
                  ),
                  Text(
                    bmrDescription,
                    style: Theme.of(context).primaryTextTheme.headline5.apply(color: Theme.of(context).backgroundColor, fontSizeDelta: -2),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: ReusableCard(
              colour: Theme.of(context).accentColor,
              gradient: Constants.kBackgroundGradientBlue,
              containerShape: BoxShape.rectangle,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'TDEE',
                    style: Theme.of(context).primaryTextTheme.headline4.apply(color: Theme.of(context).backgroundColor),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        tdeeResult,
                        style: Theme.of(context).primaryTextTheme.headline4.apply(color: Colors.tealAccent, fontSizeDelta: 9),
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Text(
                        'kcal',
                        style: Theme.of(context).primaryTextTheme.headline5.apply(color: Theme.of(context).backgroundColor),
                      ),
                    ],
                  ),
                  Text(
                    tdeeDescription,
                    style: Theme.of(context).primaryTextTheme.headline5.apply(color: Theme.of(context).backgroundColor, fontSizeDelta: -2),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ReusableCard(
              colour: Theme.of(context).accentColor,
              gradient: Constants.kBackgroundGradientBlue,
              containerShape: BoxShape.rectangle,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'TWEE',
                    style: Theme.of(context).primaryTextTheme.headline4.apply(color: Theme.of(context).backgroundColor),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        tweeResult,
                        style: Theme.of(context).primaryTextTheme.headline4.apply(color: Colors.tealAccent, fontSizeDelta: 6),
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Text(
                        'kcal',
                        style: Theme.of(context).primaryTextTheme.headline5.apply(color: Theme.of(context).backgroundColor),
                      ),
                    ],
                  ),
                  Text(
                    tweeDescription,
                    style: Theme.of(context).primaryTextTheme.headline5.apply(color: Theme.of(context).backgroundColor, fontSizeDelta: -2),
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
                  'RECALCULATE',
                  style: Theme.of(context).primaryTextTheme.headline4.apply(color: Theme.of(context).backgroundColor),
                ),
              ),
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: bottomContainerColour,
                gradient: Constants.kBackgroundGradientOrange,
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
