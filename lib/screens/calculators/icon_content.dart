import 'package:flutter/material.dart';
import 'calculator_constants.dart';

///reusable widget to set an icon with consistent size and colour
class IconContent extends StatelessWidget {
  final IconData icon;

  IconContent({this.icon});

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
      ],
    );
  }
}