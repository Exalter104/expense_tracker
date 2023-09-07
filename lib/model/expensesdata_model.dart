import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();
const uuid = Uuid();

enum Category { food, leisure, travel, work }

const categoryIcons = {
  Category.food: Icons.room_service,
  Category.leisure: Icons.queue_play_next_sharp,
  Category.travel: Icons.house_outlined,
  Category.work: Icons.task_alt_sharp,
};

class ExpenseDataModel {
  ExpenseDataModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final double amount;
  final Category category;
  final DateTime date;
  final String id;
  final String title;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  final Category category;
  final List<ExpenseDataModel> expenseDataModel;

  ExpenseBucket({required this.category, required this.expenseDataModel});

  ExpenseBucket.forCategory(List<ExpenseDataModel> allExpenses, this.category)
      : expenseDataModel = allExpenses
            .where((expense) => expense.category == category)
            .toList();
  double get totalExpenses {
    double sum = 0;
    for (final expense in expenseDataModel) {
      sum = sum + expense.amount;
    }
    return sum;
  }
}
