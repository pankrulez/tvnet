import 'package:flutter/material.dart';
import 'package:tvnet/resources/shadedContainer.dart';
import 'package:tvnet/screens/documents.dart';
import '../resources/constants.dart';

class EditProfilePage extends StatelessWidget {
  static String id = 'profile_edit_page';
  final double balance = 0.0;
  final String username = 'alex_johnson01';
  const EditProfilePage({Key? key}) : super(key: key);

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
                    ],
                  ),
                ],
              ),
              Column(
                children: const [
                  Text(
                    'EDIT PROFILE',
                    style: TextStyle(),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      /*IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.hourglass_bottom_outlined),
                      ),*/
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
                            padding: const EdgeInsets.all(20.0),
                            margin: const EdgeInsets.only(
                                top: 10.0,
                                bottom: 10.0,
                                right: 10.0,
                                left: 10.0),
                            child: Column(
                              children: const [
                                TextField(
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    //prefixIconColor: Colors.blue,
                                    //focusColor: Colors.blue,
                                    prefixIcon: Icon(Icons.call),
                                    hintText: 'Mobile Number',
                                    border: InputBorder.none,
                                  ),
                                ),
                                Divider(
                                  height: 20.0,
                                  thickness: 0.25,
                                  color: Colors.blue,
                                ),
                                TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    prefixIcon:
                                        Icon(Icons.mail_outline_rounded),
                                    hintText: 'Email ID',
                                    border: InputBorder.none,
                                  ),
                                ),
                                Divider(
                                  height: 20.0,
                                  thickness: 0.25,
                                  color: Colors.blue,
                                ),
                                TextField(
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.router_rounded),
                                    hintText: '7C:A8:4F:67:08:09',
                                    border: InputBorder.none,
                                  ),
                                ),
                                Divider(
                                  height: 20.0,
                                  thickness: 0.25,
                                  color: Colors.blue,
                                ),
                                TextField(
                                  keyboardType: TextInputType.datetime,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.cake_rounded),
                                    hintText: 'Birthday',
                                    border: InputBorder.none,
                                  ),
                                ),
                                Divider(
                                  height: 20.0,
                                  thickness: 0.25,
                                  color: Colors.blue,
                                ),
                                TextField(
                                  keyboardType: TextInputType.streetAddress,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.home_rounded),
                                    hintText: 'Address',
                                    border: InputBorder.none,
                                  ),
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
                          onTap: () {},
                          padding: const EdgeInsets.only(
                            top: 10.0,
                            bottom: 10.0,
                            right: 40.0,
                            left: 40.0,
                          ),
                          margin:
                              const EdgeInsets.only(top: 20.0, bottom: 20.0),
                          child: const Text(
                            'SAVE',
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
}
