import 'package:expense_tracker/dashboard/expenses_list/expenses_items.dart';
import 'package:expense_tracker/model/expensesdata_model.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenseDataModelList,
  });
  final List<ExpenseDataModel> expenseDataModelList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenseDataModelList.length,
        itemBuilder: (ctx, indexNumber) {
          return ExpensesItems(expenseDataModelList[indexNumber]);
        });
  }
}
