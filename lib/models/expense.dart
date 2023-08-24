import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd(); // formatter object (Y/M/D)

const uuid = Uuid(); // Create a Uuid instance

enum Category {
  // the only possible categories
  food,
  travel,
  leisure,
  work
}

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : expenseId =
            uuid.v4(); // Create a v4 Uuid (random) and assign it to expenseId

  String expenseId;
  final String title;
  final double amount;
  final DateTime date;
  //final String category; // leisure Expense(category = 'Lesure') this not safe enough , (too flexible)
  final Category category;
  String get formattedDate {
    return formatter.format(date);
  }
}
