import 'package:flutter/material.dart';

class MyTheme {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: darkModeBoxColor,
    colorScheme: const ColorScheme.dark(),
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: lightModeBoxColor,
    colorScheme: const ColorScheme.light(),
  );
}

dynamic dashboardTextStyleNormal =
    const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400);

dynamic dashboardTextStyleBold =
    const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold);
Color lightModeBoxColor = Colors.grey.shade300;
Color lightModeShadow1Color = Colors.grey.shade500;
Color lightModeShadow2Color = Colors.white;
Color darkModeBoxColor = Colors.grey.shade900;
Color darkModeShadow1Color = Colors.black;
Color darkModeShadow2Color = Colors.grey.shade800;

const TextStyle materialTextStyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontStyle: FontStyle.italic,
);

Widget kgradientContainer = Container(
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      colors: <Color>[Colors.deepOrange, Colors.blue],
      begin: FractionalOffset(0.0, 0.0),
      end: FractionalOffset(0.9, 1.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp,
    ),
  ),
);

class GradientButton extends StatelessWidget {
  final Widget child;
  final dynamic onTap;
  final dynamic padding;
  final dynamic margin;

  const GradientButton(
      {Key? key,
      required this.child,
      required this.onTap,
      this.padding,
      this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
        gradient: LinearGradient(
          colors: <Color>[Colors.deepOrange, Colors.blue],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(0.9, 1.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
