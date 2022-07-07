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
          child: Material(
            color: brightness == Brightness.dark
                ? darkModeBoxColor
                : lightModeBoxColor,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
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
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    GradientButton(
                                      padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        right: 15,
                                        left: 15,
                                      ),
                                      margin: const EdgeInsets.only(top: 5.0),
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, EditProfilePage.id);
                                      },
                                      child: const Text('Edit Profile'),
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
                            const Text('My Balance'),
                            Text('₹ $balance'),
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
                                    right: 10.0,
                                    left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: const [
                                        Icon(Icons.ac_unit_rounded),
                                        SizedBox(width: 20.0),
                                        Text('Triveniview Enterprises Pvt Ltd'),
                                      ],
                                    ),
                                    const Divider(
                                      height: 20.0,
                                      thickness: 0.25,
                                      color: Colors.blue,
                                    ),
                                    Row(
                                      children: const [
                                        Icon(Icons.manage_accounts_rounded),
                                        SizedBox(width: 20.0),
                                        Text('Alex Johnson'),
                                      ],
                                    ),
                                    const Divider(
                                      height: 20.0,
                                      thickness: 0.25,
                                      color: Colors.blue,
                                    ),
                                    Row(
                                      children: const [
                                        Icon(Icons.call),
                                        SizedBox(width: 20.0),
                                        Text('9876543210'),
                                      ],
                                    ),
                                    const Divider(
                                      height: 20.0,
                                      thickness: 0.25,
                                      color: Colors.blue,
                                    ),
                                    Row(
                                      children: const [
                                        Icon(Icons.mail_outline_rounded),
                                        SizedBox(width: 20.0),
                                        Text('abc@abc.com'),
                                      ],
                                    ),
                                    const Divider(
                                      height: 20.0,
                                      thickness: 0.25,
                                      color: Colors.blue,
                                    ),
                                    Row(
                                      children: const [
                                        Icon(Icons.router_rounded),
                                        SizedBox(width: 20.0),
                                        Text('7C:A8:4F:67:08:09'),
                                      ],
                                    ),
                                    const Divider(
                                      height: 20.0,
                                      thickness: 0.25,
                                      color: Colors.blue,
                                    ),
                                    Row(
                                      children: const [
                                        Icon(Icons.cake_rounded),
                                        SizedBox(width: 20.0),
                                        Text('01/01/2001'),
                                      ],
                                    ),
                                    const Divider(
                                      height: 20.0,
                                      thickness: 0.25,
                                      color: Colors.blue,
                                    ),
                                    Row(
                                      children: const [
                                        Icon(Icons.home_rounded),
                                        SizedBox(width: 20.0),
                                        Flexible(
                                          child: Text('12 Grand Avenue NY'),
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
                            GradientButton(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, UploadedDocuments.id);
                              },
                              padding: const EdgeInsets.only(
                                top: 12.0,
                                bottom: 12.0,
                                right: 40.0,
                                left: 40.0,
                              ),
                              margin: const EdgeInsets.only(
                                top: 20.0,
                                bottom: 10.0,
                              ),
                              child: const Text(
                                'View Document',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
