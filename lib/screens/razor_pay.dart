import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tvnet/resources/shadedContainer.dart';
import '../resources/constants.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum RechargeSchedule { later, now }

class RazorPay extends StatefulWidget {
  static String id = 'razor_pay';
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
  RechargeSchedule? schedule = RechargeSchedule.later;

  //static const platform = MethodChannel("razorpay_flutter");

  late Razorpay _razorpay;
  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    Orientation orientation = MediaQuery.of(context).orientation;
    //Size size = MediaQuery.of(context).size;
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
                    'PLAN DETAILS',
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
                    const SizedBox(height: 10.0),
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
                              'Plan Name - $plan',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    const SizedBox(height: 20.0),
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Center(
                                  child: Text(
                                    'Data',
                                  ),
                                ),
                                const SizedBox(height: 14.0),
                                Center(
                                  child: Text(
                                    data,
                                    style: const TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: ShadedContainer(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            padding:
                                const EdgeInsets.only(top: 22.0, bottom: 22.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                    style: const TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: ShadedContainer(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            padding:
                                const EdgeInsets.only(top: 22.0, bottom: 22.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Package Price',
                                ),
                                const SizedBox(height: 14.0),
                                Text(
                                  '₹ $packagePrice',
                                  style: const TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(
                          child: ShadedContainer(
                            padding: const EdgeInsets.all(20.0),
                            margin: const EdgeInsets.only(
                                top: 10.0,
                                bottom: 10.0,
                                right: 10.0,
                                left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Text('Plan Type'),
                                    const Spacer(),
                                    Text(planType),
                                  ],
                                ),
                                const Divider(
                                  height: 20.0,
                                  thickness: 0.25,
                                  color: Colors.blue,
                                ),
                                Row(
                                  children: [
                                    const Text('Usage Time'),
                                    const Spacer(),
                                    Text(usageTime),
                                  ],
                                ),
                                const Divider(
                                  height: 20.0,
                                  thickness: 0.25,
                                  color: Colors.blue,
                                ),
                                Row(
                                  children: [
                                    const Text('Primary Speed'),
                                    const Spacer(),
                                    Text(primarySpeed),
                                  ],
                                ),
                                const Divider(
                                  height: 20.0,
                                  thickness: 0.25,
                                  color: Colors.blue,
                                ),
                                Row(
                                  children: [
                                    const Text('Secondary Speed'),
                                    const Spacer(),
                                    Text(secondarySpeed),
                                  ],
                                ),
                                const Divider(
                                  height: 20.0,
                                  thickness: 0.25,
                                  color: Colors.blue,
                                ),
                                Row(
                                  children: [
                                    const Text('Secondary Data'),
                                    const Spacer(),
                                    Text(secondaryData),
                                  ],
                                ),
                                const Divider(
                                  height: 20.0,
                                  thickness: 0.25,
                                  color: Colors.blue,
                                ),
                                Row(
                                  children: const [
                                    /*ListTile(
                                        title: Text('Later'),
                                        leading: Radio<RechargeSchedule>(
                                          value: RechargeSchedule.later,
                                          groupValue: schedule,
                                          onChanged: (RechargeSchedule? value) {
                                            setState(
                                              () {
                                                schedule = value;
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      ListTile(
                                        title: Text('Now'),
                                        leading: Radio<RechargeSchedule>(
                                          value: RechargeSchedule.now,
                                          groupValue: schedule,
                                          onChanged: (RechargeSchedule? value) {
                                            setState(
                                              () {
                                                schedule = value;
                                              },
                                            );
                                          },
                                        ),
                                      ),*/
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
                        GradientButton(
                          onTap: openCheckout,
                          padding: const EdgeInsets.only(
                            top: 10.0,
                            bottom: 10.0,
                            right: 30.0,
                            left: 30.0,
                          ),
                          margin: const EdgeInsets.only(top: 20),
                          child: const Text(
                            'Purchase Now',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
          ),
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
      'amount': packagePrice,
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
    if (kDebugMode) {
      print('Success Response: $response');
    }
    Fluttertoast.showToast(
        msg: "SUCCESS: ${response.paymentId!}",
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    if (kDebugMode) {
      print('Error Response: $response');
    }
    Fluttertoast.showToast(
        msg: "ERROR: ${response.code} - ${response.message!}",
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    if (kDebugMode) {
      print('External SDK Response: $response');
    }
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: ${response.walletName!}",
        toastLength: Toast.LENGTH_SHORT);
  }
}
