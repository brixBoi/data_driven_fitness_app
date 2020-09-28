import 'package:flutter/material.dart';
import 'reusable_card.dart';


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