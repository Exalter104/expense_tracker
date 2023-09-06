import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { airbnbApp, seedswildApp, taskApp, serviceApp }

const categoryIcons = {
  Category.airbnbApp: Icons.room_service,
  Category.seedswildApp: Icons.lunch_dining,
  Category.serviceApp: Icons.lunch_dining,
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
}
