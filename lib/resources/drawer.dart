import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/login_page.dart';
import 'constants.dart';

class DrawerWindow extends StatefulWidget {
  const DrawerWindow({Key? key}) : super(key: key);

  @override
  State<DrawerWindow> createState() => _DrawerWindowState();
}

class _DrawerWindowState extends State<DrawerWindow> {
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
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool darkModeEnabled = false;
    _checkIfDarkModeEnabled() {
      final ThemeData theme = Theme.of(context);
      theme.brightness == MyTheme.darkTheme.brightness
          ? darkModeEnabled = true
          : darkModeEnabled = false;
      if (darkModeEnabled) {
        return true;
      } else {
        return false;
      }
    }

    return Drawer(
      elevation: 6,
      backgroundColor:
          _checkIfDarkModeEnabled() ? darkModeBoxColor : lightModeBoxColor,
      child: ListView(
        padding: const EdgeInsets.only(right: 20, left: 20),
        children: [
          const DrawerHeader(
            child: Center(
              child: Text(
                'MENU',
                style: TextStyle(fontSize: 35),
              ),
            ),
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(
                  Icons.auto_graph_outlined,
                  color: Colors.orangeAccent,
                ),
                SizedBox(width: 10),
                Text('Data Session'),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(
                  Icons.switch_account_outlined,
                  color: Colors.green,
                ),
                SizedBox(width: 10),
                Text('Switch Account'),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(
                  Icons.power_settings_new_rounded,
                  color: Colors.redAccent,
                ),
                SizedBox(width: 10),
                Text('Sign Out'),
              ],
            ),
            onTap: () {
              _auth.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
