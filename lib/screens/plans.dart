import 'package:flutter/material.dart';
import 'package:tvnet/resources/charts.dart';
import 'package:get/get.dart';
import 'package:tvnet/resources/internet_plans.dart';

class AllPlans extends StatelessWidget {
  static String id = 'data_plans_screen';
  const AllPlans({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          elevation: 5.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: const [
                  /*BackButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),*/
                ],
              ),
              Column(
                children: const [
                  Text('INTERNET PLANS'),
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
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                text: 'All',
              ),
              Tab(
                text: 'Unlimited',
              ),
              Tab(
                text: 'Limited',
              ),
              Tab(
                text: 'FUP',
              ),
              Tab(
                text: 'Day & Night',
              ),
            ],
            indicatorColor: Colors.white,
            /*indicator: BoxDecoration(
                backgroundBlendMode: BlendMode.softLight,
                color: Color(0xff00e5ff),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                ),
                border: Border.symmetric()),*/
          ),
        ),
        body: SafeArea(
          child: Material(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: TabBarView(
                children: <Widget>[
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Space for search bar',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                      const Expanded(
                        child: InternetPlans(),
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Space for search bar',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                      const Expanded(
                        child: InternetPlans(),
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Space for search bar',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                      const Expanded(
                        child: InternetPlans(),
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Space for search bar',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                      const Expanded(
                        child: InternetPlans(),
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Space for search bar',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                      const Expanded(
                        child: InternetPlans(),
                      ),
                    ],
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
