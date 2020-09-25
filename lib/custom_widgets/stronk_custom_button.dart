import 'package:flutter/material.dart';

/// Custom button used throughout app for important operations, e.g. signing in, submitting a form etc
class StronkFlatButton extends StatelessWidget {
  const StronkFlatButton({
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
  final defaultHeight = 50.0;
  final defaultWidth = 250.0;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0.0),
      //Make button transparent so decoration can be seen
      color: Colors.transparent,
      child: Ink(
        // Use given height if specified, otherwise the default height
        height: (height != null) ? height : defaultHeight,
        width: (width != null) ? width : defaultWidth,
        decoration: boxDecoration,
        child: Container(
          height: (height != null) ? height : defaultHeight,
          width: (width != null) ? width : defaultWidth,
          // Minimum / max constraints so Text is always visible
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
        // Run function given in constructor
        onPress();
      },
    );
  }
}
