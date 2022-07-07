import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MaterialYouNavBar extends StatefulWidget {
  const MaterialYouNavBar({Key? key}) : super(key: key);

  @override
  State<MaterialYouNavBar> createState() => _MaterialYouNavBarState();
}

class _MaterialYouNavBarState extends State<MaterialYouNavBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        indicatorColor: Colors.white.withOpacity(0.5),
        labelTextStyle: MaterialStateProperty.all(
          const TextStyle(),
        ),
      ),
      child: NavigationBar(
        height: 10.0,
        animationDuration: const Duration(seconds: 1),
        backgroundColor: Colors.deepOrange,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.add_task),
            icon: Icon(Icons.add_task_outlined),
            label: 'Task',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.support_agent),
            icon: Icon(Icons.support_agent_outlined),
            label: 'Support',
          ),
          NavigationDestination(
            selectedIcon: Icon(CupertinoIcons.profile_circled),
            icon: Icon(CupertinoIcons.profile_circled),
            label: 'Profile',
          ),
        ],
        selectedIndex: selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
