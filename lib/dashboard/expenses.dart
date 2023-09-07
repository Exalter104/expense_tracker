import 'package:expense_tracker/dashboard/chart/chart.dart';
import 'package:expense_tracker/dashboard/expenses_list/expenses_list.dart';
import 'package:expense_tracker/dashboard/new_expense.dart';
import 'package:expense_tracker/model/expensesdata_model.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) => NewExpense(onAddExpense: _addExpense));
  }

  void _addExpense(ExpenseDataModel expenseDataModel) {
    setState(() {
      _registeredExpenses.add(expenseDataModel);
    });
  }

  void _removeExpense(ExpenseDataModel expenseDataModel) {
    final expenseIndex = _registeredExpenses.indexOf(expenseDataModel);
    setState(() {
      _registeredExpenses.remove(expenseDataModel);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Expense deleted"),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expenseDataModel);
            });
          }),
    ));
  }

  final List<ExpenseDataModel> _registeredExpenses = [
    ExpenseDataModel(
        title: "food",
        amount: 70.89,
        date: DateTime.now(),
        category: Category.food),
    ExpenseDataModel(
        title: "leisure",
        amount: 56778.89,
        date: DateTime.now(),
        category: Category.leisure),
    ExpenseDataModel(
        title: "travel",
        amount: 233.89,
        date: DateTime.now(),
        category: Category.travel),
    ExpenseDataModel(
        title: "work",
        amount: 233.89,
        date: DateTime.now(),
        category: Category.work)
  ];
  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text("No Expense found . Start add Some expense"),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenseDataModelList: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add)),
        ],
        title: const Text("EXPENSE TRACKER"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(child: mainContent)
        ],
      ),
    );
  }
}
