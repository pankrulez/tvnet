import 'package:flutter/material.dart';

import 'package:tvnet/resources/charts.dart';

class DataUsage extends StatelessWidget {
  static String id = 'data_usage_screen';
  const DataUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Brightness brightness = MediaQuery.of(context).platformBrightness;
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 5.0,
          title: const Text('DATA USAGE DETAILS'),
          centerTitle: true,
          backgroundColor: Colors.blue.withOpacity(0.7),
          bottom: TabBar(
            tabs: const <Widget>[
              Tab(
                text: 'Last Usage Details',
              ),
              Tab(
                text: 'Weekly Usage Details',
              ),
            ],
            labelColor: Colors.white,
            //indicatorColor: Colors.deepOrange,
            indicator: BoxDecoration(
              color: Colors.lightBlueAccent.withOpacity(0.5),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(25.0),
                topLeft: Radius.circular(25.0),
              ),
              border: const Border.symmetric(),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: TabBarView(
              children: <Widget>[
                Container(
                  //enabling scrolling in landscape
                  child:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? const PieChart()
                          : ListView(
                              physics: const RangeMaintainingScrollPhysics(),
                              children: const [
                                PieChart(),
                              ],
                            ),
                ),
                Container(
                  child:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? const BarGraphChart()
                          : ListView(
                              physics: const RangeMaintainingScrollPhysics(),
                              children: const [
                                BarGraphChart(),
                              ],
                            ),
                ),
              ],
            ),
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
