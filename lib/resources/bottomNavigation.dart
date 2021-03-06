import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tvnet/resources/shadedContainer.dart';
import 'package:tvnet/screens/my_plan.dart';
import 'package:tvnet/screens/profile.dart';
import 'package:tvnet/screens/support.dart';
import '../screens/dashboard.dart';
import 'constants.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  static int selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    const RechargePlans(),
    const SupportPage(),
    const ProfilePage(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    //Brightness brightness = Brightness.light;
    return BottomNavigationBar(
      backgroundColor:
          brightness == Brightness.dark ? darkModeBoxColor : lightModeBoxColor,
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
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: ShadedContainer(
            padding: const EdgeInsets.all(8.0),
            child: const Icon(
              Icons.home,
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: ShadedContainer(
            padding: const EdgeInsets.all(8.0),
            child: const Icon(
              Icons.add_task_rounded,
            ),
          ),
          label: 'Plan',
        ),
        BottomNavigationBarItem(
          icon: ShadedContainer(
            padding: const EdgeInsets.all(8.0),
            child: const Icon(
              Icons.support_agent_rounded,
            ),
          ),
          label: 'Support',
        ),
        BottomNavigationBarItem(
          icon: ShadedContainer(
            padding: const EdgeInsets.all(8.0),
            child: const Icon(
              CupertinoIcons.profile_circled,
            ),
          ),
          label: 'Profile',
        ),
      ],
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      //backgroundColor: Colors.lightBlue,
    );
  }
}
