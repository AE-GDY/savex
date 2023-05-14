import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class FutureScenarioAnalysis extends StatefulWidget {
  const FutureScenarioAnalysis({Key? key}) : super(key: key);

  @override
  _FutureScenarioAnalysisState createState() => _FutureScenarioAnalysisState();
}

class _FutureScenarioAnalysisState extends State<FutureScenarioAnalysis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Future Scenario Analysis'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        child: Container(
          height:  MediaQuery.of(context).size.height + 200,
          child: Column(
            children: [
              SizedBox(height: 30,),

              Row(children: [Text('   Income this month',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),],),

              SizedBox(height: 10,),

              Row(children: [Text('   6000 EGP',style: TextStyle(fontSize: 17),),],),
              SizedBox(height: 10,),
              Divider(color: Colors.black,),
              SizedBox(height: 10,),
              Row(children: [Text('   Expenditures this month',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),],),

              SizedBox(height: 10,),

              Row(children: [Text('   9000 EGP',style: TextStyle(fontSize: 17),),],),
              SizedBox(height: 10,),
              Divider(color: Colors.black,),
              SizedBox(height: 10,),
              Row(children: [Text('   Future Scenario',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),],),

              SizedBox(height: 10,),
              Row(children: [Text('   Month 1: 7,000 EGP',style: TextStyle(fontSize: 17,color: Colors.green,fontWeight: FontWeight.bold),),],),
              SizedBox(height: 10,),
              Row(children: [Text('   Month 2: 4,000 EGP',style: TextStyle(fontSize: 17,color: Colors.green,fontWeight: FontWeight.bold),),],),
              SizedBox(height: 10,),
              Row(children: [Text('   Month 3: 1,000 EGP',style: TextStyle(fontSize: 17,color: Colors.green,fontWeight: FontWeight.bold),),],),
              SizedBox(height: 10,),
              Row(children: [Text('   Month 4: -2,000 EGP',style: TextStyle(fontSize: 17,color: Colors.red,fontWeight: FontWeight.bold),),],),
              SizedBox(height: 10,),
              Row(children: [Text('   Month 5: -5,000 EGP',style: TextStyle(fontSize: 17,color: Colors.red,fontWeight: FontWeight.bold),),],),
              SizedBox(height: 10,),
              Row(children: [Text('   Month 6: -8,000 EGP',style: TextStyle(fontSize: 17,color: Colors.red,fontWeight: FontWeight.bold),),],),
              SizedBox(height: 10,),
              Row(children: [Text('   Month 7: -11,000 EGP',style: TextStyle(fontSize: 17,color: Colors.red,fontWeight: FontWeight.bold),),],),
              SizedBox(height: 10,),
              Divider(color: Colors.black,),
              SizedBox(height: 10,),
              Row(children:[Text('  Cash Flow',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)],),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: LineChart(
                  LineChartData(borderData: FlBorderData(show: false), lineBarsData: [
                    LineChartBarData(spots: [
                      const FlSpot(20, 4),
                      const FlSpot(15, 7),
                      const FlSpot(6, 17),
                      const FlSpot(5, 13),
                      const FlSpot(4, 12),
                      const FlSpot(3, 7),
                      const FlSpot(2, 10),
                      const FlSpot(1, 3),
                      const FlSpot(0, 1),
                    ],color: Colors.red),
                  ]),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
