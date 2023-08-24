import 'package:flutter/material.dart';
import 'package:expense_rate_app/models/expense.dart';
import 'package:expense_rate_app/widgets/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter course',
        amount: 19.9,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Cinema',
        amount: 15.69,
        date: DateTime.now(),
        category: Category.leisure),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const Text('The chart'),
        Expanded(child: ExpensesList(registeredExpenses: _registeredExpenses)),
      ]),
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
    );
  }
}
