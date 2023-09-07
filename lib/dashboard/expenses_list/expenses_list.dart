import 'package:expense_tracker/dashboard/expenses_list/expenses_items.dart';
import 'package:expense_tracker/model/expensesdata_model.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenseDataModelList,
    required this.onRemoveExpense,
  });
  final List<ExpenseDataModel> expenseDataModelList;
  final void Function(ExpenseDataModel expenseDataModel) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenseDataModelList.length,
        itemBuilder: (ctx, indexNumber) {
          return Dismissible(
              key: ValueKey(expenseDataModelList[indexNumber]),
              onDismissed: (direction) {
                onRemoveExpense(expenseDataModelList[indexNumber]);
              },
              child: ExpensesItems(expenseDataModelList[indexNumber]));
        });
  }
}
