import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tvnet/resources/constants.dart';

class PieChart extends StatelessWidget {
  final String lastUpdate = '10 Jun 2022';

  const PieChart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool darkModeEnabled = false;
    _checkIfDarkModeEnabled() {
      final ThemeData theme = Theme.of(context);
      theme.brightness == MyTheme.darkTheme.brightness
          ? darkModeEnabled = true
          : darkModeEnabled = false;
      if (darkModeEnabled) {
        return true;
      } else {
        return false;
      }
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: SizedBox(
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? constraints.maxHeight
                : constraints.maxWidth,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Last Updated on $lastUpdate',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'You are currently online',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SfCircularChart(
                        title: null,
                        legend: Legend(
                          isVisible: true,
                          position: LegendPosition.bottom,
                          offset: const Offset(0.0, 0.0),
                          overflowMode: LegendItemOverflowMode.wrap,
                          toggleSeriesVisibility: false,
                        ),
                        series: _getLegendOptionsSeries(),
                        tooltipBehavior: TooltipBehavior(enable: true),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Card(
                          color: _checkIfDarkModeEnabled()
                              ? darkModeBoxColor
                              : lightModeBoxColor,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.deepOrange),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: const [
                                  Text(
                                    'Total Data',
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    'Unlimited',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          color: _checkIfDarkModeEnabled()
                              ? darkModeBoxColor
                              : lightModeBoxColor,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.deepOrange),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: const [
                                  Text(
                                    'Remaining Data',
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    'Unlimited',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                          '*All numeric data are rounded off to their nearest value'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<PieSeries<UsageData, String>> _getLegendOptionsSeries() {
    return <PieSeries<UsageData, String>>[
      PieSeries<UsageData, String>(
        dataSource: <UsageData>[
          UsageData(x: 'Download', y: 21),
          UsageData(x: 'Upload', y: 5),
        ],
        explode: true,
        explodeIndex: 0,
        explodeOffset: '10%',
        enableTooltip: true,
        xValueMapper: (UsageData data, _) => data.x,
        yValueMapper: (UsageData data, _) => data.y,
        dataLabelSettings: const DataLabelSettings(
          isVisible: true,
          labelPosition: ChartDataLabelPosition.outside,
          textStyle: TextStyle(fontSize: 15.0),
        ),
        startAngle: 90,
        endAngle: 90,
        legendIconType: LegendIconType.seriesType,
      ),
    ];
  }
}

class UsageData {
  dynamic x;
  dynamic y;
  UsageData({this.x, this.y});
}

class BarGraphChart extends StatelessWidget {
  const BarGraphChart({Key? key}) : super(key: key);
  static DateTime currentDate = DateTime.now();
  static int currentMonth = currentDate.month;
  static int currentDay = currentDate.day;

  @override
  Widget build(BuildContext context) {
    bool darkModeEnabled = false;
    _checkIfDarkModeEnabled() {
      final ThemeData theme = Theme.of(context);
      theme.brightness == MyTheme.darkTheme.brightness
          ? darkModeEnabled = true
          : darkModeEnabled = false;
      if (darkModeEnabled) {
        return true;
      } else {
        return false;
      }
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: SizedBox(
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? constraints.maxHeight
              : constraints.maxWidth,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: const [
                        Text(
                          'Data used in last 7 days',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'You are currently online',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SfCartesianChart(
                        legend: Legend(
                          isVisible: true,
                          position: LegendPosition.bottom,
                        ),
                        primaryXAxis: DateTimeAxis(
                          labelFormat: '{value}/$currentMonth',
                          minimum: DateTime(0, currentMonth, currentDay - 8),
                          maximum: DateTime(0, currentMonth, currentDay + 1),
                          interval: 1,
                          edgeLabelPlacement: EdgeLabelPlacement.hide,
                        ),
                        primaryYAxis: NumericAxis(
                          axisLine: const AxisLine(width: 0),
                          maximum: 30,
                          minimum: 0,
                          interval: 5,
                        ),
                        series: <
                            StackedColumnSeries<_SplineAreaData, DateTime>>[
                          StackedColumnSeries<_SplineAreaData, DateTime>(
                            dataSource: getData(),
                            name: 'Download',
                            width: 0.3,
                            xValueMapper: (_SplineAreaData date, _) =>
                                date.date,
                            yValueMapper: (_SplineAreaData data, _) => data.y1,
                          ),
                          StackedColumnSeries<_SplineAreaData, DateTime>(
                            dataSource: getData(),
                            name: 'Upload',
                            width: 0.3,
                            xValueMapper: (_SplineAreaData date, _) =>
                                date.date,
                            yValueMapper: (_SplineAreaData data, _) => data.y2,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Card(
                        color: _checkIfDarkModeEnabled()
                            ? darkModeBoxColor
                            : lightModeBoxColor,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.deepOrange),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: const [
                                Text(
                                  'Total Data',
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  'Unlimited',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        color: _checkIfDarkModeEnabled()
                            ? darkModeBoxColor
                            : lightModeBoxColor,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.deepOrange),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: const [
                                Text(
                                  'Remaining Data',
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  'Unlimited',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                        '*All numeric data are rounded off to their nearest value'),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  getData() {
    List<_SplineAreaData> chartData = <_SplineAreaData>[
      _SplineAreaData(
          date: DateTime(0, currentMonth, currentDay - 7), y1: 15, y2: 3),
      _SplineAreaData(
          date: DateTime(0, currentMonth, currentDay - 6), y1: 10, y2: 5),
      _SplineAreaData(
          date: DateTime(0, currentMonth, currentDay - 5), y1: 5, y2: 2),
      _SplineAreaData(
          date: DateTime(0, currentMonth, currentDay - 4), y1: 12, y2: 10),
      _SplineAreaData(
          date: DateTime(0, currentMonth, currentDay - 3), y1: 15, y2: 10),
      _SplineAreaData(
          date: DateTime(0, currentMonth, currentDay - 2), y1: 9, y2: 5),
      _SplineAreaData(
          date: DateTime(0, currentMonth, currentDay - 1), y1: 20, y2: 8),
      _SplineAreaData(
          date: DateTime(0, currentMonth, currentDay), y1: 13, y2: 10),
    ];
    return chartData;
  }
}

class _SplineAreaData {
  DateTime date;
  int y1;
  int y2;
  _SplineAreaData({required this.date, required this.y1, required this.y2});
}
