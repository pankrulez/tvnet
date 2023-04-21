import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tvnet/resources/shadedContainer.dart';
import 'package:tvnet/screens/plans.dart';
import 'package:tvnet/screens/razor_pay.dart';
import '../resources/constants.dart';

class RechargePlans extends StatelessWidget {
  const RechargePlans({Key? key}) : super(key: key);
  static String id = 'recharge_plans';
  final String plan = '200mbps Unlimited';
  final String data = '3000 GB';
  final String planValidity = '1 month';
  final double packagePrice = 1349.00;

  @override
  Widget build(BuildContext context) {
    bool darkModeEnabled = false;
    Orientation orientation = MediaQuery.of(context).orientation;
    var myPlanData = ModalRoute.of(context)?.settings.arguments.toString();
    String? newIndex = myPlanData;
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

    return SafeArea(
      child: Scaffold(
        appBar: newIndex == '[1]'
            ? AppBar(
                automaticallyImplyLeading: newIndex == '[1]' ? true : false,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          child: newIndex == '[1]'
                              ? null
                              : const IconButton(
                                  onPressed: null,
                                  icon: Icon(Icons.add,
                                      color: Colors.transparent),
                                ),
                        ),
                        Row(
                          children: const [
                            IconButton(
                              onPressed: null,
                              icon: Icon(Icons.add, color: Colors.transparent),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: const [
                        Text(
                          'MY PLAN',
                          style: TextStyle(),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.hourglass_bottom_outlined,
                                color: Colors.transparent,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.power_settings_new_outlined,
                                color: Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                flexibleSpace: kGradientContainer,
              )
            : null,
        body: SafeArea(
          child: Expanded(
            child: ListView(
              physics: orientation == Orientation.portrait
                  ? const NeverScrollableScrollPhysics()
                  : const ClampingScrollPhysics(),
              children: [
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    color: Colors.blue.withOpacity(0.7),
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? 100.0
                              : 120,
                          height: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
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
                                    fontSize:
                                        MediaQuery.of(context).orientation ==
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
                                    fontSize:
                                        MediaQuery.of(context).orientation ==
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
                const SizedBox(height: 40.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ShadedContainer(
                        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                        padding: const EdgeInsets.only(top: 22.0, bottom: 22.0),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Data',
                                    style: kItalicText,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 14.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    data,
                                    style: kBoldItalicBlueText,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ShadedContainer(
                        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                        padding: const EdgeInsets.only(top: 22.0, bottom: 22.0),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Validity',
                                    style: kItalicText,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 14.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    planValidity,
                                    style: kBoldItalicBlueText,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30.0),
                Expanded(
                  child: ShadedContainer(
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                    padding: const EdgeInsets.only(
                        top: 20.0, right: 10.0, left: 10.0, bottom: 20.0),
                    child: Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Package Price',
                                    style: kItalicText,
                                  ),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    '₹ $packagePrice',
                                    style: kBoldItalicBlueText,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  GradientButton(
                                    padding: const EdgeInsets.only(
                                      top: 12,
                                      bottom: 12,
                                      right: 20,
                                      left: 20,
                                    ),
                                    child: Text(
                                      'Purchase Now',
                                      style: kButtonText,
                                    ),
                                    onTap: () {
                                      //Navigator.pushNamed(context, RazorPay.id);
                                      Get.to(() => const RazorPay(),
                                          transition:
                                              Transition.leftToRightWithFade,
                                          duration: const Duration(
                                              milliseconds: 400));
                                    },
                                  ),
                                ],
                              ),

                              //const SizedBox(height: 5.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                      child: ShadedContainer(
                        padding: const EdgeInsets.all(20.0),
                        margin: const EdgeInsets.only(
                            top: 10.0, bottom: 10.0, right: 10.0, left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Want to purchase a new plan? ',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GradientButton(
                                  onTap: () {
                                    //Navigator.pushNamed(context, AllPlans.id);
                                    Get.to(
                                      () => const AllPlans(),
                                      transition:
                                          Transition.leftToRightWithFade,
                                      duration:
                                          const Duration(milliseconds: 400),
                                    );
                                  },
                                  padding: const EdgeInsets.only(
                                    top: 12,
                                    bottom: 12,
                                    right: 25,
                                    left: 25,
                                  ),
                                  child: Text(
                                    'Click Here',
                                    style: kButtonText,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
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
