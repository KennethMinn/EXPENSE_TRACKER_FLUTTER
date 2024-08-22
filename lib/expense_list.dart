import 'package:expense_tracker/expense_card.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  final List<Expense> expenses;

  const ExpenseList({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    //ListView - like Column but scrollable -builder only create when the widget is visible
    return ListView.builder(
        itemCount: expenses.length, //func will run expenses.length times
        itemBuilder: (ctx, index) => ExpenseCard(expenses[index]));
  }
}
