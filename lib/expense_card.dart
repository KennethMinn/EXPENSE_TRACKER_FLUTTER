import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {
  final Expense expense;

  const ExpenseCard(this.expense, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}'),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 10),
                    Text(expense.formattedDate)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
