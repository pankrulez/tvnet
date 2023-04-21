import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tvnet/resources/dashboard_resources.dart';
import 'package:tvnet/resources/drawer.dart';
import 'package:tvnet/screens/my_plan.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tvnet/screens/profile.dart';
import 'package:tvnet/screens/support.dart';

class Dashboard extends StatefulWidget {
  static String id = 'dashboard_screen';
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double turns = 0.0;
  bool isClicked = false;
  final _auth = FirebaseAuth.instance;
  User? loggedInUser;
  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static int selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    DashboardResources(navKey: navigationKey),
    const RechargePlans(),
    const SupportPage(),
    const ProfilePage(),
  ];
  static final List<String> _selectedTitle = <String>[
    'DASHBOARD',
    'MY PLAN',
    'SUPPORT',
    'PROFILE'
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final items = <Widget>[
    const Icon(Icons.home),
    const Icon(Icons.add_task_rounded),
    const Icon(Icons.support_agent_rounded),
    const Icon(CupertinoIcons.profile_circled),
  ];

  static GlobalKey<CurvedNavigationBarState> navigationKey =
      GlobalKey<CurvedNavigationBarState>();

  @override
  Widget build(BuildContext context) {
    //var myPlanData = ModalRoute.of(context)?.settings.arguments;
    //String indexValue = myPlanData.toString();
    return SafeArea(
      top: false,
      child: ClipRect(
        child: Scaffold(
          extendBody: true,
          drawerEnableOpenDragGesture: true,
          drawerScrimColor: Colors.black.withOpacity(0.5),
          drawer: const DrawerWindow(),
          appBar: AppBar(
            elevation: 0.0,
            bottomOpacity: 0,
            title: Text(
              _selectedTitle.elementAt(selectedIndex),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.blue.withOpacity(0.7),
            //flexibleSpace: kGradientContainer,
          ),
          body: _widgetOptions.elementAt(selectedIndex),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              iconTheme: const IconThemeData(color: Colors.white),
            ),
            child: CurvedNavigationBar(
              key: navigationKey,
              backgroundColor: Colors.transparent,
              color: Colors.blue.withOpacity(0.7),
              buttonBackgroundColor: Colors.deepOrangeAccent,
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 600),
              items: items,
              height: 60,
              index: selectedIndex,
              onTap: onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}
