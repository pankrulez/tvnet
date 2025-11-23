import 'package:flutter/material.dart';

import 'constants.dart';

class AnimatedShadedContainer extends StatefulWidget {
  const AnimatedShadedContainer({Key? key}) : super(key: key);

  @override
  State<AnimatedShadedContainer> createState() =>
      _AnimatedShadedContainerState();
}

class _AnimatedShadedContainerState extends State<AnimatedShadedContainer>
    with TickerProviderStateMixin {
  double turns = 0.0;
  bool isClicked = false;
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      curve: Curves.easeOutExpo,
      duration: const Duration(seconds: 1),
      turns: turns,
      child: GestureDetector(
        onTap: () {
          if (isClicked) {
            setState(() => turns -= 1 / 4);
            _controller.reverse();
          } else {
            setState(() => turns += 1 / 4);
            _controller.forward();
          }
          isClicked = !isClicked;
        },
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.easeOutExpo,
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark ? darkModeBoxColor : lightModeBoxColor,
            border: Border.all(
                color: Theme.of(context).brightness == Brightness.dark
                    ? darkModeBoxColor
                    : lightModeBoxColor),
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).brightness == Brightness.dark
                    ? darkModeShadow1Color
                    : lightModeShadow1Color,
                blurRadius: 15,
                spreadRadius: 1,
                offset: isClicked
                    ? const Offset(4.0, -4.0)
                    : const Offset(4.0, 4.0),
              ),
              BoxShadow(
                color: Theme.of(context).brightness == Brightness.dark
                    ? darkModeShadow2Color
                    : lightModeShadow2Color,
                blurRadius: 15,
                spreadRadius: 1,
                offset: isClicked
                    ? const Offset(-4.0, 4.0)
                    : const Offset(-4.0, -4.0),
              )
            ],
          ),
          child: AnimatedIcon(
            progress: _controller,
            icon: AnimatedIcons.menu_close,
            color: Theme.of(context).brightness == Brightness.dark
                ? darkModeShadow2Color
                : lightModeShadow2Color,
          ),
        ),
      ),
    );
  }
}
