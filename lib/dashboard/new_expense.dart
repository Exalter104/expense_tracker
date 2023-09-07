// ignore_for_file: avoid_print

import 'package:expense_tracker/model/expensesdata_model.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(ExpenseDataModel expenseDataModel) onAddExpense;
  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _amountController = TextEditingController();
  final _titleController = TextEditingController();
  DateTime? _selectDate;
  Category _selectedCategory = Category.work;
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.day, now.month, now.year - 1);

    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);

    setState(() {
      _selectDate = pickedDate;
      print(_selectDate);
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectDate == null) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text("Invalid Expense"),
              content:
                  const Text("  Please Enter valid date , amount and category"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: const Text("Okay"),
                )
              ],
            );
          });
      return;
    }
    widget.onAddExpense(ExpenseDataModel(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectDate!,
        category: _selectedCategory));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextFormField(
            controller: _titleController,
            decoration: const InputDecoration(
                label: Text(
              "Enter the title",
              maxLines: 50,
            )),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  // onChanged: _saveTitleInput,
                  controller: _amountController,
                  keyboardType: TextInputType.number,

                  decoration: const InputDecoration(
                      prefixText: "\$",
                      label: Text(
                        "Enter the amount",
                        maxLines: 20,
                      )),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(_selectDate == null
                        ? "Select Date"
                        : formatter.format(_selectDate!)),
                    IconButton(
                      onPressed: () {
                        _presentDatePicker();
                      },
                      icon: const Icon(Icons.calendar_today_outlined),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map((seleectCategory) => DropdownMenuItem(
                          value: seleectCategory,
                          child: Text(seleectCategory.name.toLowerCase())))
                      .toList(),
                  onChanged: (changeCategoryName) {
                    if (changeCategoryName == null) {
                      return;
                    }
                    _selectedCategory = changeCategoryName;
                    setState(() {
                      _selectedCategory;
                      print(_selectedCategory);
                    });
                  }),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("cancel")),
              ElevatedButton(
                  onPressed: () {
                    _submitExpenseData();
                  },
                  child: const Text("Save Expense")),
            ],
          )
        ],
      ),
    );
  }
}
