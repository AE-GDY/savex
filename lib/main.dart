import 'package:flutter/material.dart';
import 'package:savex/screens/add_card.dart';
import 'package:savex/screens/add_trading_account.dart';
import 'package:savex/screens/analytics.dart';
import 'package:savex/screens/authenticate.dart';
import 'package:savex/screens/bank_account_input.dart';
import 'package:savex/screens/budget_input.dart';
import 'package:savex/screens/cash_tracker.dart';
import 'package:savex/screens/finances.dart';
import 'package:savex/screens/future_scenario_analysis.dart';
import 'package:savex/screens/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savex/screens/personal_goal_setter.dart';
import 'package:savex/screens/personal_goals.dart';
import 'package:savex/screens/trading_account_input.dart';


// MAIN FUNCTION
void main() {
  runApp(const MyApp());
}

// MAIN CLASS
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // MATERIAL APP BUILDER
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,

        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.black),
          hintStyle: TextStyle(color: Colors.black),

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.deepPurpleAccent),
          ),

        ),
      ),
      debugShowCheckedModeBanner: false,
      // INITIAL SCREEN
      initialRoute: '/authenticate',
      // ALL ROUTES TO SCREENS
      routes: {
        '/': (context) => const Home(), // HOME SCREEN
        '/authenticate': (context) => const Authenticate(), // AUTHENTICATION SCREEN
        '/budget_input': (context) => const BudgetInput(), // BUDGET INPUT SCEEN
        '/bank_account_input': (context) => const BankAccountInput(), // BANK ACCOUNT INPUT SCREEN
        '/add_card': (context) => const AddCard(), // ADDING CARD SCREEN
        '/personal_goal_setter':(context) => const PersonalGoalSetter(), // GOAL SETTER SCREEN
        '/personal_goals_screen':(context) => const PersonalGoalsScreen(), // LIST OF GOALS SCREEN
        '/cash_tracker':(context) => const CashTracker(), // CASH TRACKER SCREEN
        '/trading_account_input': (context) => TradingAccountInput(), // TRADING ACCOUNT INPUT SCREEN
        '/add_trading_account': (context) => const AddTradingAccount(), // ADD TRADING CARD SCREEN
        '/finances': (context) => const Finances(), // FINANCES SCREEN
        '/analytics': (context) => const Analytics(), // ANALYTICS SCREEN
        '/future': (context) => const FutureScenarioAnalysis(), // FUTURE ANALYSIS SCREEN
      },
    );
  }
}
