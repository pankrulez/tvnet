import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/my_plan.dart';
import '../screens/profile.dart';
import '../screens/support.dart';
import 'constants.dart';
import 'dashboard_resources.dart';

class CurvedNavBar extends StatefulWidget {
  const CurvedNavBar({Key? key}) : super(key: key);

  @override
  State<CurvedNavBar> createState() => _CurvedNavBarState();
}

class _CurvedNavBarState extends State<CurvedNavBar> {
  final items = <Widget>[
    const Icon(Icons.home),
    const Icon(Icons.add_task_rounded),
    const Icon(Icons.support_agent_rounded),
    const Icon(CupertinoIcons.profile_circled),
  ];
  static final List<Widget> _widgetOptions = <Widget>[
    DashboardResources(navKey: navigationKey),
    const RechargePlans(),
    const SupportPage(),
    const ProfilePage(),
  ];
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  int selectedIndex = 0;
  static GlobalKey<CurvedNavigationBarState> navigationKey =
      GlobalKey<CurvedNavigationBarState>();
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      key: navigationKey,
      backgroundColor: Colors.transparent,
      color: Brightness.dark == true ? darkModeBoxColor : lightModeBoxColor,
      buttonBackgroundColor: Colors.blue,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 400),
      items: items,
      height: 60,
      index: selectedIndex,
      onTap: onItemTapped,
    );
  }
}
