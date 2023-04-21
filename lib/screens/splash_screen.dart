import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../resources/constants.dart';
import 'dashboard.dart';
import 'login_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  final _auth = FirebaseAuth.instance;
  User? loggedInUser;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
    splashScreenTimer();
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

  splashScreenTimer() {
    Timer(const Duration(seconds: 2), () async {
      loggedInUser == null
          ? Get.to(const LoginScreen(), transition: Transition.fadeIn)
          : Get.offAll(const Dashboard(),
              transition: Transition.zoom,
              duration: const Duration(seconds: 2));
    });
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

    return Container(
      color: _checkIfDarkModeEnabled() ? darkModeBoxColor : lightModeBoxColor,
      child: const Center(
        child: Icon(
          Icons.backup_rounded,
          size: 200,
          color: Colors.blue,
        ),
      ),
    );
  }
}
