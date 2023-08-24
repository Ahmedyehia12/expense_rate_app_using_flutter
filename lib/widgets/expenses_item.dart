import 'package:flutter/material.dart';
import 'package:expense_rate_app/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  final Expense expenseItem;
  const ExpenseItem({super.key, required this.expenseItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      child: Card(
          child: Column(
        children: [
          Text(expenseItem.title),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Text('\$${expenseItem.amount.toStringAsFixed(2)} '),
              const Spacer(), // all the space that could be taken
              Row(
                children: [
                  const Icon(Icons.alarm),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(expenseItem.date.toString())
                ],
              )
            ],
          )
        ],
      )),
    );
  }
}
