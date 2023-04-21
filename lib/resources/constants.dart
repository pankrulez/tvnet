import 'package:flutter/material.dart';

class MyTheme {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: darkModeBoxColor,
    //scaffoldBackgroundColor: Colors.transparent,
    colorScheme: const ColorScheme.dark(),
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: lightModeBoxColor,
    colorScheme: const ColorScheme.light(),
  );
}

TextStyle kButtonText =
    const TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
TextStyle kBoldText = const TextStyle(fontWeight: FontWeight.bold);
TextStyle kItalicText = const TextStyle(fontStyle: FontStyle.italic);
TextStyle kBoldItalicText = const TextStyle(
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.italic,
);
TextStyle kBoldItalicBlueText = const TextStyle(
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.italic,
  color: Colors.blue,
);
Color lightModeBoxColor = Colors.grey.shade300;
Color lightModeShadow1Color = Colors.grey.shade500;
Color lightModeShadow2Color = Colors.white;
Color darkModeBoxColor = Colors.grey.shade900;
Color darkModeShadow1Color = Colors.black;
Color darkModeShadow2Color = Colors.grey.shade800.withOpacity(0.8);

const TextStyle kMaterialTextStyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontStyle: FontStyle.italic,
);

Widget kGradientContainer = Container(
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
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 6,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        color: Colors.transparent,
        child: Container(
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
            child: child),
      ),
    );
  }
}

class TicketContainer extends StatelessWidget {
  final getMessage;
  final boxColor;
  final textColor;
  final margin;
  final padding;

  const TicketContainer(
      {Key? key,
      required this.getMessage,
      required this.boxColor,
      this.textColor,
      this.margin,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: RawMaterialButton(
        onPressed: null,
        child: Text(
          getMessage,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
