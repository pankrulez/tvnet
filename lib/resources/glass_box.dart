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
                    color: Colors.white.withAlpha((0.5 * 255).round()),
                  ),
                  gradient: LinearGradient(
                    colors: <Color>[
                      Colors.deepOrange.withAlpha((0.4 * 255).round()),
                      Colors.blue.withAlpha((0.2 * 255).round()),
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
