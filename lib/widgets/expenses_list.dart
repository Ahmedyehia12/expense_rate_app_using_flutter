import 'package:flutter/material.dart';
import 'package:expense_rate_app/models/expense.dart';
import 'package:expense_rate_app/widgets/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> registeredExpenses;
  const ExpensesList({super.key, required this.registeredExpenses});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // list of unknown length  , scrorable by default
        // listview.builder build widgets only when visible
        itemCount: registeredExpenses.length, // count of items in the list
        itemBuilder: (context, index) => ExpenseItem(
            expenseItem:
                registeredExpenses[index]) // only created when they are needed
        );
  }
}
