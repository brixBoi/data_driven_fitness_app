import 'package:flutter/material.dart';

class SignupField extends StatelessWidget {
  const SignupField({
    Key key,
    this.label,
    this.keyboardType,
    this.obscureText,
    @required this.errorText,
    @required this.regex,
    this.controller,
    this.fieldColor,
    this.textEntryColor,
    this.height,
    this.width,
  }) : super(key: key);

  final TextInputType keyboardType;
  final String label;
  final bool obscureText;
  final String errorText;
  final String regex;
  final TextEditingController controller;
  final Color fieldColor;
  final Color textEntryColor;
  final int height;
  final int width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (height != null) ? height : 90,
      width: (width != null) ? width : 270,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: TextFormField(
          controller: controller,
          obscureText: (obscureText != null) ? obscureText : false,
          style: TextStyle(
            color: textEntryColor,
            fontSize: 20,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            labelStyle: TextStyle(
              color: fieldColor,
            ),
            labelText: label,
            errorStyle: TextStyle(fontSize: 15, color: Colors.redAccent),
          ),
          keyboardType: keyboardType,
          validator: (value) {
            String output;
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
