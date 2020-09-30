import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function onTouch;
  final BoxShape containerShape;
  final Gradient gradient;

  ReusableCard(
      {this.colour,
      this.cardChild,
      this.onTouch,
      this.containerShape,
      this.gradient});

  @override
  Widget build(BuildContext context) {
    BorderRadius getRadius() {
      BorderRadiusGeometry radius;
      (containerShape == BoxShape.circle)
          ? radius = null
          : radius = BorderRadius.circular(3.0);
      return radius;
    }

    return GestureDetector(
      onTap: onTouch,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          gradient: gradient,
          shape: containerShape,
          borderRadius: getRadius(),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[400],
              blurRadius: 5.0,
              spreadRadius: 0.8,
              offset: Offset(
                8.0,
                8.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}

