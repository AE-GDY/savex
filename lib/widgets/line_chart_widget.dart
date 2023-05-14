import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:savex/data/expenses_data.dart';

class LineChartWidget extends StatelessWidget {
  final List<charts.Series<ExpensesData, String>> seriesList;
  final bool animate;

  LineChartWidget(this.seriesList, {required this.animate});

  @override
  Widget build(BuildContext context) {
    return charts.LineChart(
      seriesList.cast<charts.Series<dynamic, num>>(),
      animate: animate,
    );
  }
}

final seriesLine = charts.Series<ExpensesData, String>(
  id: 'Category Data',
  domainFn: (ExpensesData expensesData, _) => expensesData.month,
  measureFn: (ExpensesData expensesData, _) => int.parse(expensesData.expenses),
  colorFn: (ExpensesData expensesData, _) => expensesData.barColor,
  data: expenses,
);


