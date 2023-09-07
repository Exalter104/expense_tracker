import 'package:expense_tracker/dashboard/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Expense tracker App ',
        theme: ThemeData().copyWith(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 96, 59, 181),
          ),
          appBarTheme: const AppBarTheme().copyWith(),
          useMaterial3: true,
        ),
        home: const Expenses());
  }
}
