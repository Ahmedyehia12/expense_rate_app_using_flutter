import 'package:flutter/material.dart';
import 'package:expense_rate_app/models/expense.dart';

class NewExpense extends StatefulWidget {
  final Function addNewExpense;
  const NewExpense({super.key, required this.addNewExpense});
  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
    // this line will only be executable when that await function is done
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final notValidAmount = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        notValidAmount ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Invalid input'),
                content: const Text(
                    'Please make sure a valid title / amount / date and category was entered'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const Text('OK'),
                  )
                ],
              ));
      return;
    }
    Expense newExpense = Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory);

    setState(() {
      widget.addNewExpense(newExpense);
      Navigator.pop(context);
    });
  }

  @override
  void dispose() {
    _titleController
        .dispose(); // deleting controller after the widget is not needed.
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context)
        .viewInsets
        .bottom; //(overlapping from the bottom)

    return LayoutBuilder(builder: (ctx, constrains) {
      final width = constrains.maxWidth;
      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 48, 16, keyboardSpace + 16),
            child: Column(
              children: [
                if (width >= 600)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _titleController,
                          maxLength: 50,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            label: Text('Title'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            label: Text('Amount'),
                            prefixText: '\$',
                          ),
                        ),
                      ),
                    ],
                  )
                else
                  TextField(
                    controller: _titleController,
                    maxLength: 50,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      label: Text('Title'),
                    ),
                  ),
                if (width >= 600)
                  Row(
                    children: [
                      DropdownButton(
                          value: _selectedCategory,
                          items: Category.values
                              .map((category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(category.name.toUpperCase())))
                              .toList(),
                          onChanged: (value) {
                            if (value == null) {
                              return;
                            }
                            setState(() {
                              _selectedCategory = value;
                            });
                          }),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(_selectedDate == null
                                ? 'No date selected'
                                : formatter.format(_selectedDate!)),
                            // ! tells dart that this will never be null
                            IconButton(
                              icon: const Icon(Icons.calendar_month),
                              onPressed: _presentDatePicker,
                            )
                          ],
                        ),
                      )
                    ],
                  )
                else
                  Row(// row dosen't put limitations on width
                      children: [
                    Expanded(
                      child: TextField(
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          label: Text('Amount'),
                          prefixText: '\$',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(_selectedDate == null
                              ? 'No date selected'
                              : formatter.format(_selectedDate!)),
                          // ! tells dart that this will never be null
                          IconButton(
                            icon: const Icon(Icons.calendar_month),
                            onPressed: _presentDatePicker,
                          )
                        ],
                      ),
                    )
                  ]),
                const SizedBox(
                  height: 20.0,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                if (width >= 600)
                  Row(
                    children: [
                      const Spacer(),
                      ElevatedButton(
                          onPressed: _submitExpenseData,
                          child: const Text('Save Expense')),
                      const SizedBox(
                        width: 10.0,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            // removes the modal buttom sheet from the screen
                          },
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.red),
                          ))
                    ],
                  )
                else
                  Row(
                    children: [
                      DropdownButton(
                          value: _selectedCategory,
                          items: Category.values
                              .map((category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(category.name.toUpperCase())))
                              .toList(),
                          onChanged: (value) {
                            if (value == null) {
                              return;
                            }
                            setState(() {
                              _selectedCategory = value;
                            });
                          }),
                      const Spacer(),
                      ElevatedButton(
                          onPressed: _submitExpenseData,
                          child: const Text('Save Expense')),
                      const SizedBox(
                        width: 10.0,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            // removes the modal buttom sheet from the screen
                          },
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.red),
                          )),
                    ],
                  )
              ],
            ),
          ),
        ),
      );
    });
  }
}
