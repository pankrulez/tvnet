import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tvnet/resources/shaded_container.dart';
import 'constants.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  static int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  static GlobalKey navigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      key: navigationKey,
      backgroundColor:
          Theme.of(context).brightness == Brightness.dark ? darkModeBoxColor : lightModeBoxColor,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: false,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(
        color: Colors.blue,
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle(
        color: Colors.black,
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
      ),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: ShadedContainer(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.home,
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: ShadedContainer(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.add_task_rounded,
            ),
          ),
          label: 'Plan',
        ),
        BottomNavigationBarItem(
          icon: ShadedContainer(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.support_agent_rounded,
            ),
          ),
          label: 'Support',
        ),
        BottomNavigationBarItem(
          icon: ShadedContainer(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              CupertinoIcons.profile_circled,
            ),
          ),
          label: 'Profile',
        ),
      ],
      currentIndex: selectedIndex,
      onTap: onItemTapped,
    );
  }
}
