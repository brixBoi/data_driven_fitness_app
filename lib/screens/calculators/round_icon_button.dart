import 'package:flutter/material.dart';

///Custom widget to create a round button with an icon that performs an
///action when tapped
///also ensures all buttons have the same properties visually
class RoundIconButton extends StatelessWidget {

  ///requires Icon data and some function
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