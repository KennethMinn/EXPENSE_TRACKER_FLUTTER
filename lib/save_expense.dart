import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final DateFormat formatter = DateFormat.yMd();

class SaveExpense extends StatefulWidget {
  final void Function(Expense expense) addExpense;

  const SaveExpense({super.key, required this.addExpense});

  @override
  State<SaveExpense> createState() {
    return _SaveExpenseState();
  }
}

class _SaveExpenseState extends State<SaveExpense> {
  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  DateTime? selectedDate;
  Category selectedCategory = Category.leisure;

  void onSelectDate() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: firstDate,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      selectedDate = pickedDate;
    });
  }

  void onSubmit() {
    final double? enteredAmount = double.tryParse(
        amountController.text); //tryParse return null if the value is invalid
    bool isInvalidAmount = enteredAmount == null || enteredAmount <= 0;
    if (titleController.text.trim().isEmpty ||
        isInvalidAmount ||
        selectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text("Error Input"),
              content:
                  const Text('Please make sure u enter all the input vlaues'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const Text("Okay"))
              ],
            );
          });
      return;
    }

    Expense expense = Expense(
        title: titleController.text,
        amount: enteredAmount,
        date: selectedDate!,
        category: selectedCategory);
    widget.addExpense(expense);

    Navigator.pop(context);
  }

  @override // run when the widget unmounts
  void dispose() {
    titleController.dispose(); //destory the controller
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            maxLength: 50,
            keyboardType: TextInputType.text, //default
            decoration: const InputDecoration(label: Text("Title")),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      prefixText: "\$", label: Text("Amount")),
                ),
              ),
              const SizedBox(width: 50),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(selectedDate == null
                      ? "no selected date"
                      : formatter.format(selectedDate!)),
                  IconButton(
                      onPressed: onSelectDate,
                      icon: const Icon(Icons.calendar_month))
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton(
                  value: selectedCategory,
                  items: Category.values.map((category) {
                    return DropdownMenuItem(
                        value: category, child: Text(category.name));
                  }).toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      selectedCategory = value;
                    });
                  }),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        // remove the current context(SaveExpense) off of the screen
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel")),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: onSubmit, child: const Text("Save Expense")),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
