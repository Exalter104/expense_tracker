import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();
const uuid = Uuid();

enum Category { airbnbApp, seedswildApp, taskApp, serviceApp }

const categoryIcons = {
  Category.airbnbApp: Icons.room_service,
  Category.seedswildApp: Icons.queue_play_next_sharp,
  Category.serviceApp: Icons.house_outlined,
  Category.taskApp: Icons.task_alt_sharp,
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
