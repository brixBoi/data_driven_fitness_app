import 'package:flutter/material.dart';

/// Custom TextFormField used throughout the app
class StronkTextFormField extends StatelessWidget {
  const StronkTextFormField({
    Key key,
    this.label,
    this.keyboardType,
    this.obscureText,
    @required this.errorText,
    @required this.regex,
    this.controller,
    this.labelTextColor,
    this.textEntryColor,
    this.height,
    this.width,
    this.errorTextColor,
  }) : super(key: key);

  /// Determines the type of keyboard shown to user on field focus
  final TextInputType keyboardType;
  final String label;
  final bool obscureText;
  final String errorText;
  final String regex;
  final TextEditingController controller;
  final Color labelTextColor;
  final Color textEntryColor;

  final Color errorTextColor;
  final Color defaultErrorTextColor = Colors.redAccent;

  final double height;
  final double width;
  final double defaultHeight = 90.0;
  final double defaultWidth = 270.0;

  @override
  Widget build(BuildContext context) {
    // SizedBox used to constrain size of field
    return SizedBox(
      // Use custom sizes if given, otherwise defaults
      height: (height != null) ? height : defaultHeight,
      width: (width != null) ? width : defaultWidth,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: TextFormField(
          // Used to retrieve text upon form submission
          controller: controller,
          // Hides characters for password fields
          obscureText: (obscureText != null) ? obscureText : false,
          style: TextStyle(
            color: textEntryColor,
            fontSize: 20,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            labelStyle: TextStyle(
              color: labelTextColor,
            ),
            labelText: label,
            errorStyle: TextStyle(
              fontSize: 15,
              color:
                  // Use custom color if given, otherwise default
                  (errorTextColor != null)
                      ? errorTextColor
                      : defaultErrorTextColor,
            ),
          ),
          keyboardType: keyboardType,
          // If the regular expression given and the current field text don't match, the field won't be validated
          validator: (value) {
            // Variable to return
            String output;
            // If the current field value matches the given regular expression, return the value
            if (!RegExp(regex).hasMatch(value)) {
              output = errorText;
            }
            return output;
          },
        ),
      ),
    );
  }
}
