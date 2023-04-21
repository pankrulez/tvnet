import 'package:flutter/material.dart';
import 'package:tvnet/resources/shadedContainer.dart';
import '../resources/constants.dart';
import 'package:unicons/unicons.dart';

class EditProfilePage extends StatefulWidget {
  static String id = 'profile_edit_page';
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final double balance = 0.0;
  final String username = 'alex_johnson01';
  bool obscureTextValuePass = true;
  bool obscureTextValueNewPass = true;
  bool obscureTextValueRepass = true;
  Color showPassIconColor = Colors.blueGrey;
  Color showNewPassIconColor = Colors.blueGrey;
  Color showRePassIconColor = Colors.blueGrey;

  @override
  Widget build(BuildContext context) {
    // Brightness brightness = MediaQuery.of(context).platformBrightness;
    // Orientation orientation = MediaQuery.of(context).orientation;
    //Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 5.0,
          title: const Text('EDIT PROFILE'),
          centerTitle: true,
          backgroundColor: Colors.blue.withOpacity(0.7),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: Expanded(
              child: ListView(
                physics: const RangeMaintainingScrollPhysics(),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Material(
                                  elevation: 15.0,
                                  shape: const CircleBorder(),
                                  color: Colors.transparent,
                                  child: Container(
                                    height: 100.0,
                                    width: 100.0,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Column(
                                  children: [
                                    Text(
                                      username,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'My Balance',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('₹ $balance'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      Expanded(
                        child: ShadedContainer(
                          padding: const EdgeInsets.only(
                            top: 25,
                            bottom: 25,
                            right: 15,
                            left: 15,
                          ),
                          margin: const EdgeInsets.only(
                              top: 10.0, bottom: 10.0, right: 10.0, left: 10.0),
                          child: Column(
                            children: [
                              TextField(
                                onChanged: (value) {},
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  hintText: 'Mobile Number',
                                  prefixIcon: Icon(
                                    Icons.call,
                                    color: Colors.greenAccent,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.lightBlueAccent,
                                        width: 1.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.lightBlueAccent,
                                        width: 2.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                ),
                              ),
                              const Divider(
                                color: Colors.transparent,
                                height: 12,
                              ),
                              TextField(
                                onChanged: (value) {},
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  hintText: 'Email ID',
                                  prefixIcon: Icon(
                                    Icons.mail_outline_rounded,
                                    color: Colors.redAccent,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.lightBlueAccent,
                                        width: 1.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.lightBlueAccent,
                                        width: 2.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                ),
                              ),
                              const Divider(
                                height: 12.0,
                                color: Colors.transparent,
                              ),
                              TextField(
                                onChanged: (value) {},
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  hintText: '7C:A8:4F:67:08:09',
                                  prefixIcon: Icon(
                                    Icons.router_rounded,
                                    color: Colors.teal,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.lightBlueAccent,
                                        width: 1.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.lightBlueAccent,
                                        width: 2.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                ),
                              ),
                              const Divider(
                                color: Colors.transparent,
                                height: 12,
                              ),
                              TextField(
                                onChanged: (value) {},
                                keyboardType: TextInputType.datetime,
                                decoration: const InputDecoration(
                                  hintText: 'Birthday',
                                  prefixIcon: Icon(
                                    Icons.cake_rounded,
                                    color: Colors.orangeAccent,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.lightBlueAccent,
                                        width: 1.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.lightBlueAccent,
                                        width: 2.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                ),
                              ),
                              const Divider(
                                color: Colors.transparent,
                                height: 12,
                              ),
                              TextField(
                                onChanged: (value) {},
                                keyboardType: TextInputType.streetAddress,
                                decoration: const InputDecoration(
                                  hintText: 'Address',
                                  prefixIcon: Icon(
                                    Icons.home_rounded,
                                    color: Colors.indigoAccent,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.lightBlueAccent,
                                        width: 1.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.lightBlueAccent,
                                        width: 2.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                ),
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
                        onTap: () {},
                        padding: const EdgeInsets.only(
                          top: 10.0,
                          bottom: 10.0,
                          right: 40.0,
                          left: 40.0,
                        ),
                        child: const Text(
                          'SAVE',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ExpansionTile(
                          title: const Text('Privacy and Security'),
                          children: [
                            ListTile(
                              title: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Current Password',
                                  prefixIcon: const Icon(
                                    Icons.lock_outline_rounded,
                                    color: Colors.orange,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        obscureTextValuePass =
                                            !obscureTextValuePass;
                                        if (showPassIconColor ==
                                            Colors.blueGrey) {
                                          showPassIconColor = Colors.blue;
                                        } else {
                                          showPassIconColor = Colors.blueGrey;
                                        }
                                      });
                                    },
                                    icon: Icon(
                                      Icons.remove_red_eye_rounded,
                                      color: showPassIconColor,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.lightBlueAccent,
                                        width: 1.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.lightBlueAccent,
                                        width: 2.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                ),
                                obscureText: obscureTextValuePass,
                                onChanged: (value) {},
                              ),
                            ),
                            ListTile(
                              title: TextField(
                                decoration: InputDecoration(
                                  hintText: 'New Password',
                                  prefixIcon: const Icon(
                                    Icons.lock_outline_rounded,
                                    color: Colors.orange,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        obscureTextValueNewPass =
                                            !obscureTextValueNewPass;
                                        if (showNewPassIconColor ==
                                            Colors.blueGrey) {
                                          showNewPassIconColor = Colors.blue;
                                        } else if (showNewPassIconColor ==
                                            Colors.blue) {
                                          showNewPassIconColor =
                                              Colors.blueGrey;
                                        }
                                      });
                                    },
                                    icon: Icon(
                                      Icons.remove_red_eye_rounded,
                                      color: showNewPassIconColor,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.lightBlueAccent,
                                        width: 1.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.lightBlueAccent,
                                        width: 2.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                ),
                                obscureText: obscureTextValueNewPass,
                                onChanged: (value) {},
                              ),
                            ),
                            ListTile(
                              title: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Re-Enter Password',
                                  prefixIcon: const Icon(
                                    Icons.lock_outline_rounded,
                                    color: Colors.orange,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        obscureTextValueRepass =
                                            !obscureTextValueRepass;
                                        if (showRePassIconColor ==
                                            Colors.blueGrey) {
                                          showRePassIconColor = Colors.blue;
                                        } else if (showRePassIconColor ==
                                            Colors.blue) {
                                          showRePassIconColor = Colors.blueGrey;
                                        }
                                      });
                                    },
                                    icon: Icon(
                                      Icons.remove_red_eye_rounded,
                                      color: showRePassIconColor,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.lightBlueAccent,
                                        width: 1.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.lightBlueAccent,
                                        width: 2.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                ),
                                obscureText: obscureTextValueRepass,
                                onChanged: (value) {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ExpansionTile(
                      title: const Text('Terms & Conditions'),
                      children: [
                        ListTile(
                          title: Expanded(
                            child: Row(
                              children: [
                                const Icon(
                                  UniconsLine.clipboard_notes,
                                  size: 100,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text('Terms of Service'),
                                    Text('Privacy Statement'),
                                    Text('Legal Notice'),
                                    Text('Disclaimer'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ExpansionTile(
                      title: const Text('User Feedback'),
                      children: [
                        ListTile(
                          title: Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Do you like the App?',
                                  style: kItalicText,
                                ),
                                GradientButton(
                                  margin:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  padding: const EdgeInsets.all(10),
                                  onTap: () {},
                                  child: Text(
                                    'Write a Review',
                                    style: kBoldText,
                                  ),
                                ),
                                Text(
                                  'or ',
                                  style: kItalicText,
                                ),
                                GradientButton(
                                  margin:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  padding: const EdgeInsets.all(10),
                                  onTap: () {},
                                  child: Text(
                                    'Share the App',
                                    style: kBoldText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //const SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
