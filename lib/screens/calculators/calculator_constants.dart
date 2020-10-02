import 'package:flutter/material.dart';

const baseColour = Color(0xFFB2BBFB);


const bottomContainerHeight = 85.0;
const bottomContainerColour = Color(0xFFEB1555);

//initial input values
const calcHeight = 180;
const calcWeight = 70;
const calcAge = 25;
const calcActivePosition = 2;

//genders
enum Gender {
  male,
  female,
}

const List<String> activeTypes = [
  'Sedentary',
  'Lightly Active',
  'Moderately Active',
  'Very Active'
];

//Slider properties
const onTrackColour = Colors.teal;
const offTrackColour = Colors.white70;
const slideThumbColour = Colors.blueGrey;
const slideOverlayColour = Color(0x29C5CAE9);
const slideThumbSize = 12.0;
const slideOverlaySize = 27.0;
const heightSlideMin = 130.0;
const heightSlideMax = 230.0;

//iconContent
const iconSize = 70.0;
const spacing = 5.0;

//bmr results descriptions
const bmrDescription = '*Basal Metabolic Rate: total amount of calories to keep your body functioning';
const tdeeDescription = '*Total Daily Energy Expenditure: Estimated amount of calories you burn in a day';
const tweeDescription = '*Total Weekly Energy Expenditure: Estimated amount of calories you burn in a week';