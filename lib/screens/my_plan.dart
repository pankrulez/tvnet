import 'package:flutter/material.dart';
import 'package:tvnet/resources/shadedContainer.dart';
import 'package:tvnet/screens/plans.dart';
import 'package:tvnet/screens/razor_pay.dart';
import '../resources/bottomNavigation.dart';
import '../resources/constants.dart';

class RechargePlans extends StatelessWidget {
  const RechargePlans({Key? key}) : super(key: key);
  static String id = 'recharge_plans';
  final String plan = '1299_200mbps_unlimited';
  final String data = '3000 GB';
  final String planValidity = '1 month';
  final double packagePrice = 1349.00;
  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    Orientation orientation = MediaQuery.of(context).orientation;
    //Brightness brightness = Brightness.light;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: const [
                      /*BackButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),*/
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
                        icon: const Icon(Icons.hourglass_bottom_outlined),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.power_settings_new_outlined),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          flexibleSpace: kgradientContainer,
        ),
        body: SafeArea(
          child: Material(
            color: brightness == Brightness.dark
                ? darkModeBoxColor
                : lightModeBoxColor,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: Expanded(
                child: ListView(
                  physics: orientation == Orientation.portrait
                      ? const NeverScrollableScrollPhysics()
                      : const ClampingScrollPhysics(),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100.0,
                          height: 100.0,
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Icon(
                                  Icons.add_a_photo_outlined,
                                  size: 100.0,
                                  color: brightness == Brightness.dark
                                      ? Colors.white
                                      : Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          color: brightness == Brightness.dark
                              ? darkModeBoxColor
                              : lightModeBoxColor,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.deepOrange),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'My Plan - $plan',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ShadedContainer(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            padding:
                                const EdgeInsets.only(top: 22.0, bottom: 22.0),
                            child: Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'Data',
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 14.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        data,
                                        style:
                                            const TextStyle(color: Colors.blue),
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
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            padding:
                                const EdgeInsets.only(top: 22.0, bottom: 22.0),
                            child: Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'Validity',
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 14.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        planValidity,
                                        style:
                                            const TextStyle(color: Colors.blue),
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
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            padding: const EdgeInsets.only(
                                top: 10.0, right: 5.0, left: 5.0, bottom: 10.0),
                            child: Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          'Package Price',
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '₹ $packagePrice',
                                          style: const TextStyle(
                                              color: Colors.blue),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GradientButton(
                                          padding: const EdgeInsets.all(5.0),
                                          child: const Text(
                                            'Purchase now',
                                          ),
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, RazorPay.id);
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40.0),
                    Row(
                      children: [
                        Expanded(
                          child: ShadedContainer(
                            padding: const EdgeInsets.all(20.0),
                            margin: const EdgeInsets.only(
                                top: 10.0,
                                bottom: 10.0,
                                right: 30.0,
                                left: 30.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Want to buy a new plan?',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
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
                                        Navigator.pushNamed(
                                            context, AllPlans.id);
                                      },
                                      padding: const EdgeInsets.all(10.0),
                                      child: const Text('CLICK HERE'),
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
        ),
      ),
    );
  }
}
