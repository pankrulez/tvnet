import 'dart:ui';

import 'package:flutter/material.dart';

class GlassBox extends StatelessWidget {
  final dynamic child;
  final dynamic padding;
  final dynamic margin;
  final dynamic onTap;
  const GlassBox(
      {Key? key,
      required this.child,
      required this.padding,
      this.margin,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 80,
          height: 50,
          padding: padding,
          margin: margin,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5,
                ),
                child: Container(),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  gradient: LinearGradient(
                    colors: <Color>[
                      Colors.deepOrange.withOpacity(0.4),
                      Colors.blue.withOpacity(0.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              Center(
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
