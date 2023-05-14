import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

// CLASS FOR STORING EXPENSES DATA PER MONTH
class ExpensesData {

  String month;
  String expenses;
  final charts.Color barColor;

  ExpensesData({required this.month, required this.expenses, required this.barColor});

}

// SAMPLE STATISTICS FOR EXPENSES DATA
final List<ExpensesData> expenses = [
  ExpensesData(month: 'Jan', expenses: '1000', barColor: charts.ColorUtil.fromDartColor(Colors.deepPurpleAccent),),
  ExpensesData(month: 'Feb', expenses: '1500', barColor: charts.ColorUtil.fromDartColor(Colors.deepPurpleAccent),),
  ExpensesData(month: 'Mar', expenses: '2400', barColor: charts.ColorUtil.fromDartColor(Colors.deepPurpleAccent),),
  ExpensesData(month: 'Apr', expenses: '2000', barColor: charts.ColorUtil.fromDartColor(Colors.deepPurpleAccent),),

];