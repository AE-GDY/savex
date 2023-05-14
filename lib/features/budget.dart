
import 'package:savex/features/category.dart';

// CLASS FOR STORING BUDGET CREATED BY USER
class Budget{

  static late Budget userBudget;
  static bool budgetCreated = false;

  late int totalBudget;
  late double dailyBudget;
  late double totalSpent;
  late List<Category> categories;
  late String month;

  Budget({
    required this.totalBudget,
    required this.dailyBudget,
    required this.totalSpent,
    required this.month,
    required this.categories,
  });

}