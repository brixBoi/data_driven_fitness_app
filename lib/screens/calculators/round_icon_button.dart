import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onTouch});

  final IconData icon;
  final Function onTouch;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onTouch,
      elevation: 4.0,
      constraints: BoxConstraints.tightFor(width: 40, height: 40),
      shape: BeveledRectangleBorder(),
      fillColor: Theme.of(context).backgroundColor,
    );
  }
}