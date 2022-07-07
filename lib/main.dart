import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tvnet/resources/appbar.dart';
import 'package:tvnet/resources/bottomNavigation.dart';
import 'package:tvnet/resources/constants.dart';
import 'package:tvnet/resources/shadedContainer.dart';
import 'package:tvnet/screens/create_ticket.dart';
import 'package:tvnet/screens/dashboard.dart';
import 'package:tvnet/screens/data_usage.dart';
import 'package:tvnet/screens/documents.dart';
import 'package:tvnet/screens/edit_profile.dart';
import 'package:tvnet/screens/my_plan.dart';
import 'package:tvnet/screens/plans.dart';
import 'package:tvnet/screens/profile.dart';
import 'package:tvnet/screens/razor_pay.dart';
import 'package:tvnet/screens/support.dart';
import 'package:tvnet/screens/upload_documents.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routes: {
        DataUsage.id: (context) => const DataUsage(),
        RechargePlans.id: (context) => const RechargePlans(),
        RazorPay.id: (context) => const RazorPay(),
        SupportPage.id: (context) => const SupportPage(),
        ProfilePage.id: (context) => const ProfilePage(),
        CreateTicket.id: (context) => const CreateTicket(),
        AllPlans.id: (context) => const AllPlans(),
        UploadedDocuments.id: (context) => const UploadedDocuments(),
        UploadNewDocuments.id: (context) => const UploadNewDocuments(),
        EditProfilePage.id: (context) => const EditProfilePage(),
      },
      /*getPages: [
        GetPage(name: '/DataUsage', page: () => const DataUsage()),
        GetPage(name: '/RechargePlans', page: () => RechargePlans()),
        GetPage(name: '/RazorPay', page: () => const RazorPay()),
      ],*/
      title: 'tvnet',
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static int selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
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

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: selectedIndex == 1
          ? null
          : AppBar(
              elevation: 5.0,
              title: AppBarTitle(
                child1: Row(
                  children: const [
                    IconButton(
                      onPressed: null,
                      icon: Icon(Icons.support, color: Colors.transparent),
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Icon(Icons.add, color: Colors.transparent),
                    ),
                  ],
                ),
                child2: Text(
                  _selectedTitle.elementAt(selectedIndex),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                child3: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.hourglass_bottom_outlined),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.power_settings_new_outlined),
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              flexibleSpace: kgradientContainer,
            ),
      body: SafeArea(
        child: //Dashboard(),
            _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: brightness == Brightness.dark
            ? darkModeBoxColor
            : lightModeBoxColor,
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
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
