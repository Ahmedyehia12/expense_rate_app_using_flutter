import 'package:uuid/uuid.dart';

const uuid = Uuid(); // Create a Uuid instance

enum Category {
  // the only possible categories
  food,
  travel,
  leisure,
  work
}

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
}
