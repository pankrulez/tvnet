import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final Widget child1;
  final Widget child2;
  final Widget child3;

  const AppBarTitle(
      {Key? key,
      required this.child1,
      required this.child2,
      required this.child3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [child1],
        ),
        Column(
          children: [child2],
        ),
        Column(
          children: [child3],
        ),
      ],
    );
  }
}
