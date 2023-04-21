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
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
              icon: const Icon(Icons.search),
            )
          ],
          elevation: 5.0,
          title: const Text('INTERNET PLANS'),
          centerTitle: true,
          backgroundColor: Colors.blue.withOpacity(0.5),
          bottom: TabBar(
            isScrollable: true,
            indicator: BoxDecoration(
              color: Colors.lightBlueAccent.withOpacity(0.5),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15.0),
                topLeft: Radius.circular(15.0),
              ),
              border: const Border.symmetric(),
            ),
            tabs: const <Widget>[
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
          ),
        ),
        body: SafeArea(
          child: Material(
            color: Colors.transparent,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: TabBarView(
                children: <Widget>[
                  Column(
                    children: const [
                      Expanded(
                        child: InternetPlans(),
                      ),
                      SizedBox(height: 20.0),
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

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'limited',
    'unlimited',
    'fup',
    'day',
    'night',
    '30',
    '100',
    '50',
    '150',
    '200'
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back_ios),
    );
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var items in searchTerms) {
      if (items.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(items);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var items in searchTerms) {
      if (items.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(items);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
    throw UnimplementedError();
  }
}
