import 'package:flutter/material.dart';
import 'package:expense_rate_app/models/expense.dart';
import 'package:expense_rate_app/widgets/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> registeredExpenses;
  final void Function(Expense expense) onRemoveExpense;
  const ExpensesList(
      {super.key,
      required this.registeredExpenses,
      required this.onRemoveExpense});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // list of unknown length  , scrorable by default
        // listview.builder build widgets only when visible
        itemCount: registeredExpenses.length, // count of items in the list
        itemBuilder: (context, index) => Dismissible(
              key: ValueKey(registeredExpenses[index]),
              background: Container(
                color: Theme.of(context).colorScheme.error.withOpacity(0.75),
                margin: EdgeInsets.symmetric(
                  horizontal: Theme.of(context).cardTheme.margin!.horizontal,
                ),
              ),
              onDismissed: (direction) {
                onRemoveExpense(registeredExpenses[index]);
              },
              child: ExpenseItem(expenseItem: registeredExpenses[index]),
            ) // only created when they are needed
        );
  }
}
