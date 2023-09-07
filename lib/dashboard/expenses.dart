import 'package:expense_tracker/dashboard/expenses_list/expenses_list.dart';
import 'package:expense_tracker/model/expensesdata_model.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<ExpenseDataModel> _registeredExpenses = [
    ExpenseDataModel(
        title: "Exarth",
        amount: 70.89,
        date: DateTime.now(),
        category: Category.serviceApp),
    ExpenseDataModel(
        title: "Exalter",
        amount: 56778.89,
        date: DateTime.now(),
        category: Category.seedswildApp),
    ExpenseDataModel(
        title: "Exarth",
        amount: 233.89,
        date: DateTime.now(),
        category: Category.airbnbApp)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
              height: 100,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(20)),
              child: const Center(child: Text("Chart ....."))),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Expense List",
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
              child: ExpensesList(expenseDataModelList: _registeredExpenses))
        ],
      ),
    );
  }
}
