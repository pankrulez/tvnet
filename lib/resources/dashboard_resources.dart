import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:tvnet/resources/shadedContainer.dart';
import 'package:tvnet/screens/transaction_history.dart';
import '../screens/create_ticket.dart';
import '../screens/data_usage.dart';
import 'constants.dart';

class DashboardResources extends StatefulWidget {
  final navKey;

  const DashboardResources({Key? key, required this.navKey}) : super(key: key);

  @override
  State<DashboardResources> createState() => _DashboardResourcesState();
}

class _DashboardResourcesState extends State<DashboardResources> {
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

  final String plan = '200mbps Unlimited';
  static String greeting = 'Good Morning';
  final String username = 'Alex Johnson';
  final String rechargeDate = '1 Jun 2022';
  final String expiryDate = '30 Jun 2022';
  static int usageDays = 11;
  final int remainingDays = 30 - usageDays;
  final double walletBalance = 0.0;
  final double transactionAmount = 1300.0;
  final currentDate = DateTime.now();
  String getGreeting() {
    if (currentDate.hour >= 0 && currentDate.hour <= 12) {
      greeting = 'Good Morning';
    } else if (currentDate.hour > 12 && currentDate.hour <= 16) {
      greeting = 'Good Afternoon';
    } else if (currentDate.hour > 16 && currentDate.hour <= 18) {
      greeting = 'Good Evening';
    } else {
      greeting = 'Good Night';
    }
    return greeting;
  }

  var newSelectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width.toDouble();
    double height = size.height.toDouble();
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

    return ListView(
      physics: const RangeMaintainingScrollPhysics(),
      children: [
        //const SizedBox(height: 10.0),
        ClipPath(
          clipper: MyClipper(),
          child: Container(
            color: Colors.blue.withOpacity(0.7),
            padding: const EdgeInsets.only(bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 100.0
                          : 120,
                  height:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 100.0
                          : 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Icon(
                          Icons.add_a_photo_outlined,
                          size: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? 100.0
                              : 120,
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  color: _checkIfDarkModeEnabled()
                      ? darkModeBoxColor
                      : lightModeBoxColor,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.deepOrange),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? const EdgeInsets.only(
                            top: 10, bottom: 10, right: 20, left: 20)
                        : const EdgeInsets.only(
                            top: 12, bottom: 12, right: 30, left: 30),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'My Plan - ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _checkIfDarkModeEnabled()
                                ? Colors.white
                                : Colors.black,
                            fontSize: MediaQuery.of(context).orientation ==
                                    Orientation.portrait
                                ? null
                                : 20,
                          ),
                        ),
                        TextSpan(
                          text: plan,
                          style: TextStyle(
                            color: _checkIfDarkModeEnabled()
                                ? Colors.white
                                : Colors.black,
                            fontSize: MediaQuery.of(context).orientation ==
                                    Orientation.portrait
                                ? null
                                : 20,
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        ShadedContainer(
          margin: const EdgeInsets.only(
            right: 12.0,
            left: 12.0,
            top: 10.0,
          ),
          padding: const EdgeInsets.only(right: 20.0, left: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    getGreeting(),
                    style: kItalicText,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    loggedInUser?.email as String,
                    style: kBoldItalicText,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Expiry Date : $expiryDate',
                    style: kItalicText,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 140.0,
                    width: 120.0,
                    child: SfRadialGauge(
                      enableLoadingAnimation: true,
                      axes: <RadialAxis>[
                        RadialAxis(
                          showLabels: false,
                          interval: 10,
                          axisLineStyle: const AxisLineStyle(
                            thickness: 0.3,
                            thicknessUnit: GaugeSizeUnit.factor,
                            color: Colors.deepOrange,
                          ),
                          showTicks: false,
                          radiusFactor: 0.8,
                          pointers: const <GaugePointer>[
                            NeedlePointer(
                              needleLength: 0.8,
                              value: 70,
                              needleColor: Colors.blue,
                              needleStartWidth: 0,
                              needleEndWidth: 3.0,
                              knobStyle: KnobStyle(
                                color: Colors.blue,
                                knobRadius: 0.05,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        ShadedContainer(
          margin: const EdgeInsets.only(
            right: 12.0,
            left: 12.0,
            top: 25.0,
          ),
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Used ',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: _checkIfDarkModeEnabled()
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: usageDays.toString(),
                          style: kBoldItalicBlueText,
                        ),
                        TextSpan(
                          text: ' Days of ',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: _checkIfDarkModeEnabled()
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '30',
                          style: kBoldItalicBlueText,
                        ),
                        TextSpan(
                          text: ' Days',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: _checkIfDarkModeEnabled()
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  LinearPercentIndicator(
                    lineHeight: 15.0,
                    width: width * 0.5,
                    percent: 0.5,
                    progressColor: Colors.deepOrange,
                    backgroundColor: Colors.blue.shade100,
                    animation: true,
                    animationDuration: 500,
                    padding: EdgeInsets.zero,
                    barRadius: const Radius.circular(
                      10.0,
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Your plan will expire in ',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: _checkIfDarkModeEnabled()
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: remainingDays.toString(),
                          style: kBoldItalicBlueText,
                        ),
                        TextSpan(
                          text: ' Days',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: _checkIfDarkModeEnabled()
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GradientButton(
                    onTap: () {
                      //Navigator.pushNamed(context, DataUsage.id);
                      Get.to(() => const DataUsage(),
                          transition: Transition.leftToRightWithFade,
                          duration: const Duration(milliseconds: 400));
                    },
                    padding: EdgeInsets.only(
                        right: width * 0.05,
                        left: width * 0.05,
                        top: 12.0,
                        bottom: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'More Details',
                          style: kButtonText,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  GradientButton(
                    onTap: () {
                      //Get.to(() => RechargePlans.id,transition:Transition.leftToRightWithFade);
                      /*Navigator.pushNamed(context, RechargePlans.id,
                          arguments: [newSelectedIndex]);*/
                      final navigationState = widget.navKey.currentState!;
                      navigationState.setPage(1);
                    },
                    padding: MediaQuery.of(context).orientation ==
                            Orientation.landscape
                        ? EdgeInsets.only(
                            right: width * 0.064,
                            left: width * 0.064,
                            top: 12.0,
                            bottom: 12.0)
                        : EdgeInsets.only(
                            right: width * 0.075,
                            left: width * 0.075,
                            top: 12.0,
                            bottom: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Recharge',
                          style: kButtonText,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        ShadedContainer(
          margin: const EdgeInsets.only(
            right: 12.0,
            left: 12.0,
            top: 25.0,
          ),
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: GradientButton(
                  onTap: () {
                    //Navigator.pushNamed(context, CreateTicket.id);
                    Get.to(const CreateTicket(),
                        transition: Transition.leftToRightWithFade,
                        duration: const Duration(milliseconds: 400));
                  },
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Create a Ticket',
                        style: kButtonText,
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Wallet Balance',
                      style: kItalicText,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '₹ ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: _checkIfDarkModeEnabled()
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: walletBalance.toString(),
                            style: kBoldItalicBlueText,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ShadedContainer(
          margin: const EdgeInsets.only(
            right: 12.0,
            left: 12.0,
            top: 25.0,
            bottom: 25.0,
          ),
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Last Transaction History',
                          style: kItalicText,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Cr ₹ ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: _checkIfDarkModeEnabled()
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                    TextSpan(
                                      text: transactionAmount.toString(),
                                      style: kBoldItalicBlueText,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                rechargeDate,
                                style: kBoldText,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GradientButton(
                  onTap: () {
                    //Navigator.pushNamed(context, TransactionHistory.id);
                    Get.to(const TransactionHistory(),
                        transition: Transition.leftToRightWithFade,
                        duration: const Duration(milliseconds: 400));
                  },
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Center(
                        child: Text(
                          'More History',
                          style: kButtonText,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
