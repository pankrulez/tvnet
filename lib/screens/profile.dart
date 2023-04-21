import 'package:flutter/material.dart';
import 'package:tvnet/resources/shadedContainer.dart';
import 'package:tvnet/screens/documents.dart';
import 'package:tvnet/screens/edit_profile.dart';
import '../resources/constants.dart';

class ProfilePage extends StatelessWidget {
  static String id = 'profile_page';
  final double balance = 0.0;
  final String username = 'alex_johnson01';
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    Orientation orientation = MediaQuery.of(context).orientation;
    //Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: Column(
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
                              const SizedBox(width: 10),
                              Column(
                                children: [
                                  Text(
                                    username,
                                    style: kBoldItalicText,
                                  ),
                                  GradientButton(
                                    padding: const EdgeInsets.only(
                                      top: 12,
                                      bottom: 12,
                                      right: 20,
                                      left: 20,
                                    ),
                                    margin: const EdgeInsets.only(top: 5.0),
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, EditProfilePage.id);
                                    },
                                    child: Text(
                                      'Edit Profile',
                                      style: kButtonText,
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
                          Text(
                            'My Balance',
                            style: kItalicText,
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: '₹ ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  color: Brightness.dark == true
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: balance.toString(),
                                style: kBoldItalicBlueText,
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    physics: orientation == Orientation.portrait
                        ? const NeverScrollableScrollPhysics()
                        : const ClampingScrollPhysics(),
                    children: [
                      const SizedBox(height: 20.0),
                      Row(
                        children: [
                          Expanded(
                            child: ShadedContainer(
                              padding: const EdgeInsets.all(20.0),
                              margin: const EdgeInsets.only(
                                top: 10.0,
                                bottom: 10.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.ac_unit_rounded,
                                        color: Colors.amberAccent,
                                      ),
                                      const SizedBox(width: 20.0),
                                      Text(
                                        'Testing App Enterprises Pvt Ltd',
                                        style: kItalicText,
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
                                      const Icon(
                                        Icons.manage_accounts_rounded,
                                        color: Colors.indigoAccent,
                                      ),
                                      const SizedBox(width: 20.0),
                                      Text(
                                        'Alex Johnson',
                                        style: kItalicText,
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
                                      const Icon(
                                        Icons.call,
                                        color: Colors.greenAccent,
                                      ),
                                      const SizedBox(width: 20.0),
                                      Text(
                                        '9876543210',
                                        style: kItalicText,
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
                                      const Icon(
                                        Icons.mail_outline_rounded,
                                        color: Colors.redAccent,
                                      ),
                                      const SizedBox(width: 20.0),
                                      Text(
                                        'abc@abc.com',
                                        style: kItalicText,
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
                                      const Icon(
                                        Icons.router_rounded,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(width: 20.0),
                                      Text(
                                        '7C:A8:4F:67:08:09',
                                        style: kItalicText,
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
                                      const Icon(
                                        Icons.cake_rounded,
                                        color: Colors.orangeAccent,
                                      ),
                                      const SizedBox(width: 20.0),
                                      Text(
                                        '01/01/2001',
                                        style: kItalicText,
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
                                      const Icon(
                                        Icons.home_rounded,
                                        color: Colors.blueAccent,
                                      ),
                                      const SizedBox(width: 20.0),
                                      Flexible(
                                        child: Text(
                                          '12 Grand Avenue NY',
                                          style: kItalicText,
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
                            onTap: () {
                              Navigator.pushNamed(
                                  context, UploadedDocuments.id);
                            },
                            padding: const EdgeInsets.only(
                              top: 12.0,
                              bottom: 12.0,
                              right: 35.0,
                              left: 35.0,
                            ),
                            child: const Text(
                              'View Document',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
