import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:tvnet/resources/shadedContainer.dart';
import 'package:tvnet/screens/razor_pay.dart';
import '../resources/bottomNavigation.dart';
import '../resources/constants.dart';
import 'package:flutter/services.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RazorPay extends StatefulWidget {
  static String id = 'recharge_plans';
  const RazorPay({Key? key}) : super(key: key);

  @override
  State<RazorPay> createState() => _RazorPayState();
}

class _RazorPayState extends State<RazorPay> {
  String plan = '1299_200mbps_unlimited';
  String data = '3000 GB';
  String planValidity = '1 month';
  double packagePrice = 1349.00;
  String planType = 'FUP';
  String usageTime = 'Unlimited';
  String primarySpeed = '100 mbps';
  String secondarySpeed = '5 mbps';
  String secondaryData = 'unlimited';
  DateTime currentDate = DateTime.now();

  static const platform = const MethodChannel("razorpay_flutter");

  late Razorpay _razorpay;
  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    Orientation orientation = MediaQuery.of(context).orientation;
    String size = MediaQuery.of(context).size as String;
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.redAccent,
        brightness: Brightness.dark,
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
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
                  ],
                ),
                Column(
                  children: const [
                    Text(
                      'PLAN DETAILS',
                      style: TextStyle(
                        color: Colors.white,
                      ),
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
            flexibleSpace: kGradientContainer,
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
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ShadedContainer(
                              child: Text(
                                'Plan Name - $plan',
                              ),
                              padding: EdgeInsets.all(5.0)),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(height: 20.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: ShadedContainer(
                              margin: EdgeInsets.only(left: 10.0, right: 10.0),
                              padding: EdgeInsets.only(top: 22.0, bottom: 22.0),
                              child: Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Center(
                                      child: const Text(
                                        'Data',
                                      ),
                                    ),
                                    const SizedBox(height: 14.0),
                                    Center(
                                      child: Text(
                                        data,
                                        style:
                                            const TextStyle(color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ShadedContainer(
                              margin: EdgeInsets.only(left: 10.0, right: 10.0),
                              padding: EdgeInsets.only(top: 22.0, bottom: 22.0),
                              child: Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const Center(
                                      child: Text(
                                        'Validity',
                                      ),
                                    ),
                                    const SizedBox(height: 14.0),
                                    Center(
                                      child: Text(
                                        planValidity,
                                        style:
                                            const TextStyle(color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ShadedContainer(
                              margin: EdgeInsets.only(left: 10.0, right: 10.0),
                              padding: EdgeInsets.only(top: 22.0, bottom: 22.0),
                              child: Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Package Price',
                                    ),
                                    const SizedBox(height: 14.0),
                                    Text(
                                      '₹ $packagePrice',
                                      style:
                                          const TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        children: [
                          Expanded(
                            child: ShadedContainer(
                              padding: EdgeInsets.all(20.0),
                              margin: EdgeInsets.only(
                                  top: 10.0,
                                  bottom: 10.0,
                                  right: 10.0,
                                  left: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Text('Plan Type'),
                                      Spacer(),
                                      Text(planType),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      Text('Usage Time'),
                                      Spacer(),
                                      Text(usageTime),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      Text('Primary Speed'),
                                      Spacer(),
                                      Text(primarySpeed),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      Text('Secondary Speed'),
                                      Spacer(),
                                      Text(secondarySpeed),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      Text('Secondary Data'),
                                      Spacer(),
                                      Text(secondaryData),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      RadioListTile(
                                        title: Text('Later($currentDate)'),
                                        value: 'later',
                                        groupValue: {
                                          'Later($currentDate)',
                                          'Now($currentDate)'
                                        },
                                        onChanged: (value) {},
                                      ),
                                      RadioListTile(
                                        title: Text('Now($currentDate)'),
                                        value: 'now',
                                        groupValue: {
                                          'Later($currentDate)',
                                          'Now($currentDate)'
                                        },
                                        onChanged: (value) {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RawMaterialButton(
                            onPressed: openCheckout,
                            child: Text('Purchase Now'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigation(),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_live_ILgsfZCZoFIKMb',
      'amount': 1300.0,
      'name': 'Triveniview Enterprises Pvt Ltd',
      'description': 'Internet Plan',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Success Response: $response');
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: $response');
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }
}
