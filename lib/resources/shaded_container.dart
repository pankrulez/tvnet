import 'package:flutter/material.dart';

import 'constants.dart';

class ShadedContainer extends StatelessWidget {
  final dynamic child;
  final dynamic padding;
  final dynamic margin;

  const ShadedContainer(
      {Key? key, required this.child, required this.padding, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool darkModeEnabled = false;
    checkIfDarkModeEnabled() {
      final ThemeData theme = Theme.of(context);
      theme.brightness == MyTheme.darkTheme.brightness
          ? darkModeEnabled = true
          : darkModeEnabled = false;
      if (darkModeEnabled) {
        return true;
      } else {
        return false;
      }
    }

    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: checkIfDarkModeEnabled() ? darkModeBoxColor : lightModeBoxColor,
        border: Border.all(
            color: checkIfDarkModeEnabled()
                ? darkModeBoxColor
                : lightModeBoxColor),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: checkIfDarkModeEnabled()
                ? darkModeShadow1Color
                : lightModeShadow1Color,
            blurRadius: 15,
            spreadRadius: 1,
            offset: const Offset(4.0, 4.0),
          ),
          BoxShadow(
            color: checkIfDarkModeEnabled()
                ? darkModeShadow2Color
                : lightModeShadow2Color,
            blurRadius: 15,
            spreadRadius: 1,
            offset: const Offset(-4.0, -4.0),
          )
        ],
      ),
      child: child,
    );
  }
}
