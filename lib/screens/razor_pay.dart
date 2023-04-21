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
  String plan = '200mbps Unlimited';
  String data = '3000 GB';
  String planValidity = '1 month';
  double packagePrice = 1349.00;
  String planType = 'FUP';
  String usageTime = 'Unlimited';
  String primarySpeed = '100 mbps';
  String secondarySpeed = '5 mbps';
  String secondaryData = 'unlimited';
  String providerName = 'Tvnet Pvt Ltd.';
  DateTime currentDate = DateTime.now();
  RechargeSchedule? schedule = RechargeSchedule.now;

  //static const platform = MethodChannel("razorpay_flutter");

  Razorpay _razorpay = Razorpay();
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

    Orientation orientation = MediaQuery.of(context).orientation;
    //Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 5.0,
          title: const Text('PLAN DETAILS'),
          centerTitle: true,
          backgroundColor: Colors.blue.withOpacity(0.7),

          //flexibleSpace: kGradientContainer,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Expanded(
              child: ListView(
                physics: orientation == Orientation.portrait
                    ? const NeverScrollableScrollPhysics()
                    : const ClampingScrollPhysics(),
                children: [
                  /*Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100.0,
                        height: 100.0,
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Expanded(
                              child: Icon(
                                Icons.add_a_photo_outlined,
                                size: 100.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),*/
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        color: _checkIfDarkModeEnabled()
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
                              TextSpan(
                                text: 'Plan Name - ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: _checkIfDarkModeEnabled()
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              TextSpan(
                                  text: plan,
                                  style: TextStyle(
                                    color: _checkIfDarkModeEnabled()
                                        ? Colors.white
                                        : Colors.black,
                                  )),
                            ]),
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
                              Center(
                                child: Text(
                                  'Data',
                                  style: kItalicText,
                                ),
                              ),
                              const SizedBox(height: 14.0),
                              Center(
                                child: Text(
                                  data,
                                  style: kBoldItalicBlueText,
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
                              Center(
                                child: Text(
                                  'Validity',
                                  style: kItalicText,
                                ),
                              ),
                              const SizedBox(height: 14.0),
                              Center(
                                child: Text(
                                  planValidity,
                                  style: kBoldItalicBlueText,
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
                              Text(
                                'Package Price',
                                style: kItalicText,
                              ),
                              const SizedBox(height: 14.0),
                              Text(
                                '₹ $packagePrice',
                                style: kBoldItalicBlueText,
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
                              top: 10.0, bottom: 10.0, right: 10.0, left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Plan Type',
                                    style: kItalicText,
                                  ),
                                  const Spacer(),
                                  Text(
                                    planType,
                                    style: kBoldItalicText,
                                  ),
                                ],
                              ),
                              const Divider(
                                height: 20.0,
                                thickness: 0.25,
                                color: Colors.blue,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Usage Time',
                                    style: kItalicText,
                                  ),
                                  const Spacer(),
                                  Text(
                                    usageTime,
                                    style: kBoldItalicText,
                                  ),
                                ],
                              ),
                              const Divider(
                                height: 20.0,
                                thickness: 0.25,
                                color: Colors.blue,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Primary Speed',
                                    style: kItalicText,
                                  ),
                                  const Spacer(),
                                  Text(
                                    primarySpeed,
                                    style: kBoldItalicText,
                                  ),
                                ],
                              ),
                              const Divider(
                                height: 20.0,
                                thickness: 0.25,
                                color: Colors.blue,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Secondary Speed',
                                    style: kItalicText,
                                  ),
                                  const Spacer(),
                                  Text(
                                    secondarySpeed,
                                    style: kBoldItalicText,
                                  ),
                                ],
                              ),
                              const Divider(
                                height: 20.0,
                                thickness: 0.25,
                                color: Colors.blue,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Secondary Data',
                                    style: kItalicText,
                                  ),
                                  const Spacer(),
                                  Text(
                                    secondaryData,
                                    style: kBoldItalicText,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: ListTile(
                                      title: Text(
                                        'Later',
                                        style: kItalicText,
                                      ),
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
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text(
                                        'Now',
                                        style: kItalicText,
                                      ),
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
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GradientButton(
                        onTap: openCheckout,
                        padding: const EdgeInsets.only(
                          top: 12.0,
                          bottom: 12.0,
                          right: 35.0,
                          left: 35.0,
                        ),
                        child: const Text(
                          'Purchase Now',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
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
      'key': 'rzp_test_6nRFj6uxCN7vYZ',
      'amount': num.parse(packagePrice.toString()) * 100,
      'name': providerName,
      'description': 'Internet Plan',
      'timeout': '300',
      'theme.color': '#2d77c2',
      'currency': 'INR',
      'allow_rotation': 'true',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      //'prefill': {'contact': '9876543210', 'email': 'test@razorpay.com'},
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
