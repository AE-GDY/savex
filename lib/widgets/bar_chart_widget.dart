import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:savex/data/category_data.dart';

class BarChartWidget extends StatelessWidget {
  final List<charts.Series<CategoryData, String>> seriesList;
  final bool animate;

  BarChartWidget(this.seriesList, {required this.animate});

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
      defaultRenderer: charts.BarRendererConfig(
        groupingType: charts.BarGroupingType.grouped,
      ),
      layoutConfig: charts.LayoutConfig(
        leftMarginSpec: charts.MarginSpec.fixedPixel(0),
        topMarginSpec: charts.MarginSpec.fixedPixel(20),
        rightMarginSpec: charts.MarginSpec.fixedPixel(10),
        bottomMarginSpec: charts.MarginSpec.fixedPixel(0),
      ),
      domainAxis: charts.OrdinalAxisSpec(
        renderSpec: charts.SmallTickRendererSpec(
          labelStyle: charts.TextStyleSpec(
            fontSize: 12,
            color: charts.MaterialPalette.black,
          ),
        ),
      ),
      primaryMeasureAxis: charts.NumericAxisSpec(
        renderSpec: charts.GridlineRendererSpec(
          labelStyle: charts.TextStyleSpec(
            fontSize: 12,
            color: charts.MaterialPalette.black,
          ),
          lineStyle: charts.LineStyleSpec(
            thickness: 1,
            color: charts.MaterialPalette.gray.shade200,
          ),
        ),
      ),
    );
  }
}


final series = charts.Series<CategoryData, String>(
  id: 'Category Data',
  domainFn: (CategoryData categoryData, _) => categoryData.category,
  measureFn: (CategoryData categoryData, _) => int.parse(categoryData.amount),
  colorFn: (CategoryData categoryData, _) => categoryData.barColor,
  data: data,
);


