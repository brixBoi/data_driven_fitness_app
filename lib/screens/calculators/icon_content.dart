import 'package:flutter/material.dart';
import 'calculator_constants.dart';


class IconContent extends StatelessWidget {
  final IconData icon;
  final String text;

  IconContent({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: iconSize,
          color: Theme.of(context).backgroundColor,
        ),
        // SizedBox(
        //   height: spacing,
        // ),
        // Text(
        //   text,
        //   style: textsTextStyle,
        // ),
      ],
    );
  }
}