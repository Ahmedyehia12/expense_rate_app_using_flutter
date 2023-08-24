import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  @override
  void dispose() {
    _titleController
        .dispose(); // deleting controller after the widget is not needed.
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text('Amount'),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {}, child: const Text('Save Expense')),
              const SizedBox(
                width: 10.0,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.red),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
