import 'package:flutter/material.dart';

import '../resources/constants.dart';

class TransactionHistory extends StatefulWidget {
  static String id = 'transaction_history_page';
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  @override
  Widget build(BuildContext context) {
    //Brightness brightness = MediaQuery.of(context).platformBrightness;
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          elevation: 5.0,
          title: const Text('TRANSACTION HISTORY'),
          centerTitle: true,
          backgroundColor: Colors.blue.withOpacity(0.7),
          bottom: TabBar(
            indicator: BoxDecoration(
              color: Colors.lightBlueAccent.withOpacity(0.5),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15.0),
                topLeft: Radius.circular(15.0),
              ),
              border: const Border.symmetric(),
            ),
            //isScrollable: true,
            tabs: const <Widget>[
              Tab(
                text: 'Purchase',
              ),
              Tab(
                text: 'Payment',
              ),
            ],
            indicatorColor: Colors.white,
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              Container(),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
