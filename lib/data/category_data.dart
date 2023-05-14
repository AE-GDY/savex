import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

// CLASS FOR STORING CATEGORY DATA
class CategoryData{

  String category;
  String amount;
  final charts.Color barColor;

  CategoryData({required this.category, required this.amount, required this.barColor});

}

// SAMPLE STATISTICS FOR CATEGORY DATA
final List<CategoryData> data = [
  CategoryData(category: 'Coffee', amount: '1000',barColor: charts.ColorUtil.fromDartColor(Colors.deepPurpleAccent),),
  CategoryData(category: 'Food', amount: '800',barColor: charts.ColorUtil.fromDartColor(Colors.deepPurpleAccent),),
  CategoryData(category: 'Beverages', amount: '1000',barColor: charts.ColorUtil.fromDartColor(Colors.deepPurpleAccent),),
  CategoryData(category: 'Groceries', amount: '2000',barColor: charts.ColorUtil.fromDartColor(Colors.deepPurpleAccent),),
];
