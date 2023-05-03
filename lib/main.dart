import 'package:flutter/material.dart';
import 'package:savex/screens/add_card.dart';
import 'package:savex/screens/add_trading_account.dart';
import 'package:savex/screens/authenticate.dart';
import 'package:savex/screens/bank_account_input.dart';
import 'package:savex/screens/budget_input.dart';
import 'package:savex/screens/cash_tracker.dart';
import 'package:savex/screens/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savex/screens/personal_goal_setter.dart';
import 'package:savex/screens/personal_goals.dart';
import 'package:savex/screens/trading_account_input.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,


        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),

        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.black),
          hintStyle: TextStyle(color: Colors.black),

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.deepPurpleAccent),
          ),

        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/authenticate',
      routes: {
        '/': (context) => const Home(),
        '/authenticate': (context) => const Authenticate(),
        '/budget_input': (context) => const BudgetInput(),
        '/bank_account_input': (context) => const BankAccountInput(),
        '/add_card': (context) => const AddCard(),
        '/personal_goal_setter':(context) => const PersonalGoalSetter(),
        '/personal_goals_screen':(context) => const PersonalGoalsScreen(),
        '/cash_tracker':(context) => const CashTracker(),
        '/trading_account_input': (context) => TradingAccountInput(),
        '/add_trading_account': (context) => const AddTradingAccount(),
      },
    );
  }
}
