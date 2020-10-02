import 'package:flutter/material.dart';
import 'calculator_constants.dart';

///A large reusable button that performs an action when tapped
class BottomContainer extends StatelessWidget {

  ///requires the text displayed on the button, a function to occur when button is touched,
  ///and gradient of colours for the background
  const BottomContainer({
    @required this.title,
    @required this.onTouch,
    @required this.gradient});

  final String title;
  final Function onTouch;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTouch,
      child: Container(
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).primaryTextTheme.headline4.apply(color: Theme.of(context).backgroundColor),
          ),
        ),
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: bottomContainerColour,
          gradient: gradient,
        ),
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}