import 'package:flutter/material.dart';

//temporary constants to be changed to conform with app theme
//constants to be put in constant folder
//const activeCardColour = Theme.of(context).accentColor;
const inActiveCardColour = Color(0xFFB2BBFB);
const bottomContainerHeight = 85.0;
const bottomContainerColour = Color(0xFFEB1555);

const calcHeight = 180;
const calcWeight = 70;
const calcAge = 25;


const textsTextStyle = TextStyle(
  fontSize: 13.0,
  color: Color(0xFF8D8E98),
);
const numbersTextStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.w600,
);

enum Gender {
  male,
  female,
}

//iconContent
const iconSize = 70.0;
const spacing = 5.0;

//result descriptions
const bmrDescription = '*Basal Metabolic Rate: total amount of calories to keep your body functioning';
const tdeeDescription = '*Total Daily Energy Expenditure: Estimated amount of calories you burn in a day';
const tweeDescription = '*Total Weekly Energy Expenditure: Estimated amount of calories you burn in a week';


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
