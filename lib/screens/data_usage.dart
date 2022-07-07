import 'package:flutter/material.dart';

import 'package:tvnet/resources/charts.dart';

class DataUsage extends StatelessWidget {
  static String id = 'data_usage_screen';
  const DataUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 5.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: const [
                  /*BackButton(
                    //onPressed: () => Get.back(),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),*/
                ],
              ),
              Column(
                children: const [
                  Text('DATA USAGE DETAILS'),
                ],
              ),
              Column(
                children: const [
                  IconButton(
                    onPressed: null,
                    icon: Icon(Icons.support, color: Colors.transparent),
                  ),
                ],
              ),
            ],
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[Colors.deepOrange, Colors.blue],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(0.9, 1.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Last Usage Details',
              ),
              Tab(
                text: 'Weekly Usage Details',
              ),
            ],
            labelColor: Colors.white,
            indicatorColor: Colors.deepOrange,
            indicator: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                ),
                border: Border.symmetric()),
          ),
        ),
        body: SafeArea(
          child: Material(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: TabBarView(
                children: <Widget>[
                  Container(
                    //enabling scrolling in landscape
                    child: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? const PieChart()
                        : ListView(
                            physics: const RangeMaintainingScrollPhysics(),
                            children: const [
                              PieChart(),
                            ],
                          ),
                  ),
                  Container(
                    child: MediaQuery.of(context).orientation ==
                            Orientation.portrait
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
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
