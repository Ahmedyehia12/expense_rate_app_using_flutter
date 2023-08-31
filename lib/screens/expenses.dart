import 'package:flutter/material.dart';
import 'package:expense_rate_app/models/expense.dart';
import 'package:expense_rate_app/widgets/expenses_list.dart';
import 'package:expense_rate_app/widgets/new_expense.dart';
import 'package:expense_rate_app/widgets/chart/chart.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  void addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  final List<Expense> _registeredExpenses = [
    // dummy data
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
  void _openAddExpenseOverLay() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return NewExpense(addNewExpense: addExpense);
          // final means that the variable will never change after the first assignment
        });
  }

  void deleteExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense Deleted'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // excutes again if we rotated the Emulator
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    Widget mainContent = const Center(
      child: Text('No expenses found , start adding some!'),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        registeredExpenses: _registeredExpenses,
        onRemoveExpense: deleteExpense,
      );
    }
    return Scaffold(
      body: width < 600
          ? Column(children: [
              Chart(expenses: _registeredExpenses),
              Expanded(child: mainContent),
            ])
          : Row(children: [
              Expanded(child: Chart(expenses: _registeredExpenses)),
              Expanded(child: mainContent),
            ]),
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverLay,
            icon: const Icon(Icons.add),
          ),
        ],
        // backgroundColor: Colors.purple,
      ),
    );
  }
}
