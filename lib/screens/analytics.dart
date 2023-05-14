import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:savex/widgets/pie_chart.dart';
import '../widgets/bar_chart_widget.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:pie_chart/pie_chart.dart';

class Analytics extends StatefulWidget {
  const Analytics({Key? key}) : super(key: key);

  @override
  _AnalyticsState createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {

  Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Analytics'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        child: Container(
          height:  MediaQuery.of(context).size.height + 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Row(children:[Text('  Average expenses per category',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)],),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.all(50),
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: BarChartWidget(
                  [series],
                  animate: true,
                ),
              ),
              SizedBox(height: 20,),
              Row(children:[Text('  Average expenses per month',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)],),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: LineChart(
                  LineChartData(borderData: FlBorderData(show: false), lineBarsData: [
                    LineChartBarData(spots: [
                      const FlSpot(0, 1),
                      const FlSpot(1, 3),
                      const FlSpot(2, 10),
                      const FlSpot(3, 7),
                      const FlSpot(4, 12),
                      const FlSpot(5, 13),
                      const FlSpot(6, 17),
                      const FlSpot(7, 15),
                      const FlSpot(8, 20)
                    ],color: Colors.deepPurpleAccent),
                  ]),
                ),
              ),

              /*
              Container(
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: charts.PieChart(seriesList,
                    animate: animate,
                    // Configure the width of the pie slices to 60px. The remaining space in
                    // the chart will be left as a hole in the center.
                    defaultRenderer: new charts.ArcRendererConfig(arcWidth: 60))
              ),
              */
            ],
          ),
        ),
      ),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 100),
      new LinearSales(1, 75),
      new LinearSales(2, 25),
      new LinearSales(3, 5),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
