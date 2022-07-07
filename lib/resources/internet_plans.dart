import 'package:flutter/material.dart';

class InternetPlans extends StatelessWidget {
  const InternetPlans({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      children: [
        Container(
          color: Colors.deepOrangeAccent,
        ),
        Container(
          color: Colors.blue,
        ),
        Container(
          color: Colors.amberAccent,
        ),
        Container(
          color: Colors.green,
        ),
      ],
    );
  }
}
