import 'package:expense_tracker/expense_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/save_expense.dart';
import 'package:flutter/material.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() {
    return _ExpenseScreenState();
  }
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final List<Expense> expenses = [
    Expense(
        title: "First Expense",
        amount: 22.3,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: "Second Expense",
        amount: 32.3,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void openSaveExpenseOverlay() {
    showModalBottomSheet(
        context: context, builder: (ctx) => const SaveExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: openSaveExpenseOverlay, icon: const Icon(Icons.add))
        ],
        title: const Text("Expense Tracker"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Chart"),
          // wrap with Expanded if the column is inside of a column
          Expanded(child: ExpenseList(expenses: expenses))
        ],
      ),
    );
  }
}
