import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvnet/resources/shadedContainer.dart';
import 'package:tvnet/screens/create_ticket.dart';

import '../resources/appbar.dart';
import '../resources/bottomNavigation.dart';
import '../resources/constants.dart';

class SupportPage extends StatelessWidget {
  static String id = 'support_page';
  const SupportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: orientation == Orientation.portrait
              ? const NeverScrollableScrollPhysics()
              : const RangeMaintainingScrollPhysics(),
          children: [
            GestureDetector(
              onTap: () {},
              child: ShadedContainer(
                padding: const EdgeInsets.all(20.0),
                margin: const EdgeInsets.only(
                  top: 20.0,
                  bottom: 20.0,
                  left: 30.0,
                  right: 30.0,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(CupertinoIcons.arrow_counterclockwise_circle_fill)
                      ],
                    ),
                    const SizedBox(width: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Ticket History',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text('Display history of your tickets'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, CreateTicket.id);
              },
              child: ShadedContainer(
                padding: const EdgeInsets.all(20.0),
                margin: const EdgeInsets.only(
                  bottom: 20.0,
                  left: 30.0,
                  right: 30.0,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(Icons.wifi_calling_3),
                      ],
                    ),
                    const SizedBox(width: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Create a Ticket',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'Raise a ticket or make an complaint',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ShadedContainer(
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.only(
                bottom: 20.0,
                left: 30.0,
                right: 30.0,
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(Icons.account_circle_sharp),
                    ],
                  ),
                  const SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Any Query?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: const [
                            Icon(Icons.call),
                            SizedBox(width: 5.0),
                            Text('Call Us'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: const [
                            Icon(Icons.mail_outline_rounded),
                            SizedBox(width: 5.0),
                            Text('Write to Us'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: const [
                            Icon(Icons.location_on_rounded),
                            SizedBox(width: 5.0),
                            Text('Visit Us'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
