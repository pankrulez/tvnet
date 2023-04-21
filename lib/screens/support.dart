import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvnet/resources/shadedContainer.dart';
import 'package:tvnet/screens/ticket_history.dart';
import '../resources/constants.dart';
import 'create_ticket.dart';

class SupportPage extends StatelessWidget {
  static String id = 'support_page';
  final tickets = 2;
  final isTicketNull = true;
  String getMessage() {
    if (isTicketNull) {
      return 'There are no pending tickets';
    } else {
      return 'You have $tickets tickets';
    }
  }

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
            const SizedBox(height: 40),
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Expanded(
                  child: RotationTransition(
                    turns: const AlwaysStoppedAnimation(352 / 360),
                    child: TicketContainer(
                      padding: const EdgeInsets.only(
                        top: 5,
                        bottom: 5,
                        right: 50,
                        left: 50,
                      ),
                      margin: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      getMessage: getMessage(),
                      textColor: Colors.transparent,
                      boxColor: Colors.greenAccent,
                    ),
                  ),
                ),
                Expanded(
                  child: RotationTransition(
                    turns: const AlwaysStoppedAnimation(356 / 360),
                    child: TicketContainer(
                      padding: const EdgeInsets.only(
                        top: 5,
                        bottom: 5,
                        right: 50,
                        left: 50,
                      ),
                      margin: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      getMessage: getMessage(),
                      textColor: Colors.transparent,
                      boxColor: Colors.redAccent,
                    ),
                  ),
                ),
                Expanded(
                  child: Material(
                    elevation: 6,
                    color: Colors.transparent,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(60),
                    ),
                    child: TicketContainer(
                      padding: const EdgeInsets.only(
                        top: 5,
                        bottom: 5,
                        right: 50,
                        left: 50,
                      ),
                      getMessage: getMessage(),
                      boxColor: Colors.lightBlue,
                      textColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, TicketHistory.id);
              },
              child: ShadedContainer(
                padding: const EdgeInsets.all(20.0),
                margin: const EdgeInsets.only(
                  top: 20.0,
                  bottom: 20.0,
                  left: 10.0,
                  right: 10.0,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(
                          CupertinoIcons.arrow_counterclockwise_circle_fill,
                          color: Colors.lightBlueAccent,
                        )
                      ],
                    ),
                    const SizedBox(width: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ticket History',
                          style: kBoldItalicText,
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          'Display history of your tickets',
                          style: kItalicText,
                        ),
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
                  left: 10.0,
                  right: 10.0,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(
                          Icons.wifi_calling_3,
                          color: Colors.lightBlueAccent,
                        ),
                      ],
                    ),
                    const SizedBox(width: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create a Ticket',
                          style: kBoldItalicText,
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          'Raise a ticket or make an complaint',
                          style: kItalicText,
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
                left: 10.0,
                right: 10.0,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Icon(
                            Icons.account_circle_sharp,
                            color: Colors.lightBlueAccent,
                          ),
                        ],
                      ),
                      const SizedBox(width: 20.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Any Query?',
                            style: kBoldItalicText,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            const Icon(
                              Icons.call,
                              color: Colors.greenAccent,
                            ),
                            const SizedBox(width: 5.0),
                            Text(
                              'Call Us',
                              style: kItalicText,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            const Icon(
                              Icons.mail_outline_rounded,
                              color: Colors.redAccent,
                            ),
                            const SizedBox(width: 5.0),
                            Text(
                              'Write to Us',
                              style: kItalicText,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: Colors.lightBlue,
                            ),
                            const SizedBox(width: 5.0),
                            Text(
                              'Visit Us',
                              style: kItalicText,
                            ),
                          ],
                        ),
                      )
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
