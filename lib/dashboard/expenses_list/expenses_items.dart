import 'package:expense_tracker/model/expensesdata_model.dart';
import 'package:flutter/material.dart';

class ExpensesItems extends StatelessWidget {
  const ExpensesItems(this.expenseDataModel, {super.key});
  final ExpenseDataModel expenseDataModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: Column(
            children: [
              Text(expenseDataModel.title),
              const SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  Text("\$${expenseDataModel.amount.toStringAsFixed(2)}"),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(categoryIcons[expenseDataModel.category]),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(expenseDataModel.formattedDate),
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
