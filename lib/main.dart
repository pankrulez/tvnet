import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tvnet/resources/constants.dart';
import 'package:tvnet/screens/create_ticket.dart';
import 'package:tvnet/screens/dashboard.dart';
import 'package:tvnet/screens/data_usage.dart';
import 'package:tvnet/screens/documents.dart';
import 'package:tvnet/screens/edit_profile.dart';
import 'package:tvnet/screens/login_page.dart';
import 'package:tvnet/screens/my_plan.dart';
import 'package:tvnet/screens/plans.dart';
import 'package:tvnet/screens/profile.dart';
import 'package:tvnet/screens/razor_pay.dart';
import 'package:tvnet/screens/splash_screen.dart';
import 'package:tvnet/screens/support.dart';
import 'package:tvnet/screens/ticket_history.dart';
import 'package:tvnet/screens/transaction_history.dart';
import 'package:tvnet/screens/upload_documents.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //initialRoute: loggedInUser == null ? LoginScreen.id : Dashboard.id,
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.id: (context) => const LoginScreen(),
        Dashboard.id: (context) => const Dashboard(),
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
        TransactionHistory.id: (context) => const TransactionHistory(),
        TicketHistory.id: (context) => const TicketHistory(),
      },

      title: 'tvnet',
      themeMode: ThemeMode.dark,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      home: const SplashScreenPage(),
    );
  }
}
