import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:tvnet/resources/constants.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:tvnet/resources/shadedContainer.dart';
import 'package:tvnet/screens/create_ticket.dart';
import 'package:tvnet/screens/data_usage.dart';
import 'package:tvnet/screens/my_plan.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);
  final String plan = '1299_200mbps_unlimited';
  String greeting = 'Good Morning';
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

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    return ListView(
      physics: const RangeMaintainingScrollPhysics(),
      children: [
        const SizedBox(height: 10.0),
        SizedBox(
          width: 100.0,
          height: 100.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(child: Icon(Icons.add_a_photo_outlined, size: 100.0)),
            ],
          ),
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
                child: RichText(
                  text: TextSpan(children: [
                    const TextSpan(
                      text: 'My Plan - ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: plan),
                  ]),
                ),
              ),
            ),
          ],
        ),
        ShadedContainer(
          margin: const EdgeInsets.only(
            right: 12.0,
            left: 12.0,
            top: 25.0,
          ),
          padding: const EdgeInsets.only(right: 20.0, left: 20.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      getGreeting(),
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      username,
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Expiry Date : $expiryDate',
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
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
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Used ',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(
                            text: usageDays.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.blue,
                            ),
                          ),
                          const TextSpan(
                            text: ' Days of ',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          const TextSpan(
                            text: '30',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.blue,
                            ),
                          ),
                          const TextSpan(
                            text: ' Days',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    LinearPercentIndicator(
                      lineHeight: 15.0,
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
                          const TextSpan(
                            text: 'Your plan will expire in ',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(
                            text: remainingDays.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.blue,
                            ),
                          ),
                          const TextSpan(
                            text: ' Days',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GradientButton(
                      onTap: () {
                        Navigator.pushNamed(context, DataUsage.id);
                        //Get.to(() => const DataUsage(), transition: Transition.leftToRightWithFade);
                      },
                      padding: const EdgeInsets.all(10.0),
                      child: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'More Details',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    GradientButton(
                      onTap: () {
                        //Get.to(() => RechargePlans.id,transition:Transition.leftToRightWithFade);
                        Navigator.pushNamed(context, RechargePlans.id);
                      },
                      padding: const EdgeInsets.only(
                          right: 20.0, left: 20.0, top: 10.0, bottom: 10.0),
                      child: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Recharge',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
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
                    Navigator.pushNamed(context, CreateTicket.id);
                  },
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Create a Ticket',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
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
                    const Text('Wallet Balance'),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: '₹ ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: walletBalance.toString(),
                            style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
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
                      children: const [
                        Text('Last Transaction History'),
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
                                    const TextSpan(
                                      text: 'Cr ₹ ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: transactionAmount.toString(),
                                      style: const TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
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
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
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
                  onTap: () {},
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Center(
                        child: Text(
                          'More History',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
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
