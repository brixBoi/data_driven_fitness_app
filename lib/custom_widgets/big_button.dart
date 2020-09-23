import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  const BigButton({
    Key key,
    @required this.title,
    this.boxDecoration,
    this.textColor,
    this.onPress,
    this.height,
    this.width,
  }) : super(key: key);

  final BoxDecoration boxDecoration;
  final String title;
  final Color textColor;
  final Function onPress;

  final height;
  final width;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0.0),
      color: Colors.transparent,
      child: Ink(
        height: (height != null) ? height : 50,
        width: (width != null) ? width : 250,
        decoration: boxDecoration,
        child: Container(
          height: (height != null) ? height : 50,
          width: (width != null) ? width : 250,
          constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
          alignment: Alignment.center,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
      onPressed: () {
        onPress();
      },
    );
  }
}

//SizedBox(
//height: (height != null) ? height : 50,
//width: (width != null) ? width : 250,
//child: Container(
//child: Center(
//child: Text(
//title,
//style: TextStyle(color: textColor, fontSize: 18),
//),
//),
//decoration: boxDecoration,
//),
//),
