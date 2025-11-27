import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

enum ExpenseType { food, travel, leisure, work }

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseType category;

  Expense({
    String? id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = Uuid().v4();
}