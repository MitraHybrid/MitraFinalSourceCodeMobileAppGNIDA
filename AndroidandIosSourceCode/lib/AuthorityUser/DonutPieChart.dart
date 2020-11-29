import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class DonutPieChart extends StatefulWidget {
  DonutPieChart({Key key}) : super(key: key);

  @override
  _DonutPieChartState createState() => _DonutPieChartState();
}

class _DonutPieChartState extends State<DonutPieChart> {
  Map<String, double> data = new Map();
  bool _loadChart = false;
  @override
  void initState() {
     _loadChart = true;
    data.addAll({
      'Assigned': 150,
      'Pending': 150,
      'Closed': 200,
      'Total Count': 500
    });
    super.initState();
  }

  List<Color> _colors = [
    Colors.teal,
    Colors.blueAccent,
    Colors.amberAccent,
    Colors.redAccent
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            // SizedBox(
            //   height: 50,
            // ),
            _loadChart
                ? PieChart(
                    dataMap: data,
                    colorList:
                        _colors, // if not declared, random colors will be chosen
                    animationDuration: Duration(milliseconds: 1500),
                    chartLegendSpacing: 32.0,
                    chartRadius: MediaQuery.of(context).size.width /
                        2.7, //determines the size of the chart
                    showChartValuesInPercentage: true,
                    showChartValues: true,
                    showChartValuesOutside: false,
                    chartValueBackgroundColor: Colors.grey[200],
                    showLegends: true,
                    legendPosition: LegendPosition
                        .right, //can be changed to top, left, bottom
                    decimalPlaces: 1,
                    showChartValueLabel: true,
                    initialAngle: 0,
                    chartValueStyle: defaultChartValueStyle.copyWith(
                      color: Colors.blueGrey[900].withOpacity(0.9),
                    ),
                    chartType:
                        ChartType.disc, //can be changed to ChartType.ring
                  )
                : SizedBox(
                    height: 50,
                  ),
            
          ],
        ),
      );
  
  }
}
