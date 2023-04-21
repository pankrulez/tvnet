import 'package:flutter/material.dart';

import '../resources/constants.dart';

class TicketHistory extends StatefulWidget {
  static String id = 'ticket_history_page';
  const TicketHistory({Key? key}) : super(key: key);

  @override
  State<TicketHistory> createState() => _TicketHistoryState();
}

class _TicketHistoryState extends State<TicketHistory> {
  final tickets = 2;
  final isTicketNull = true;
  String getMessage() {
    if (isTicketNull) {
      return 'There are no pending tickets';
    } else {
      return 'You have $tickets tickets';
    }
  }

  @override
  Widget build(BuildContext context) {
    //Brightness brightness = MediaQuery.of(context).platformBrightness;
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        title: const Text('TICKET HISTORY'),
        centerTitle: true,
        backgroundColor: Colors.blue.withOpacity(0.7),
      ),
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Expanded(
                      child: TicketContainer(
                        padding: const EdgeInsets.only(
                          top: 25,
                          bottom: 25,
                          right: 50,
                          left: 50,
                        ),
                        margin: const EdgeInsets.only(
                          top: 0,
                          bottom: 60,
                          right: 10,
                          left: 10,
                        ),
                        getMessage: getMessage(),
                        textColor: Colors.transparent,
                        boxColor: Colors.greenAccent,
                      ),
                    ),
                    Expanded(
                      child: TicketContainer(
                        padding: const EdgeInsets.only(
                          top: 25,
                          bottom: 25,
                          right: 50,
                          left: 50,
                        ),
                        margin: const EdgeInsets.only(
                          top: 0,
                          bottom: 30,
                          right: 10,
                          left: 10,
                        ),
                        getMessage: getMessage(),
                        textColor: Colors.transparent,
                        boxColor: Colors.redAccent,
                      ),
                    ),
                    Expanded(
                      child: TicketContainer(
                        padding: const EdgeInsets.only(
                          top: 25,
                          bottom: 25,
                          right: 50,
                          left: 50,
                        ),
                        margin: const EdgeInsets.only(
                          top: 0,
                          bottom: 0,
                          right: 10,
                          left: 10,
                        ),
                        getMessage: getMessage(),
                        boxColor: Colors.lightBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
