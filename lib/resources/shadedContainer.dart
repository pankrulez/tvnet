import 'package:flutter/material.dart';

import 'constants.dart';

class ShadedContainer extends StatelessWidget {
  Widget child;
  dynamic padding;
  dynamic margin;

  ShadedContainer({required this.child, required this.padding, this.margin});

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    //Brightness brightness = Brightness.light;
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: brightness == Brightness.dark
            ? darkModeBoxColor
            : lightModeBoxColor,
        border: Border.all(
            color: brightness == Brightness.dark
                ? darkModeBoxColor
                : lightModeBoxColor),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: brightness == Brightness.dark
                ? darkModeShadow1Color
                : lightModeShadow1Color,
            blurRadius: 15,
            spreadRadius: 1,
            offset: Offset(4.0, 4.0),
          ),
          BoxShadow(
            color: brightness == Brightness.dark
                ? darkModeShadow2Color
                : lightModeShadow2Color,
            blurRadius: 15,
            spreadRadius: 1,
            offset: Offset(-4.0, -4.0),
          )
        ],
      ),
      child: child,
    );
  }
}
