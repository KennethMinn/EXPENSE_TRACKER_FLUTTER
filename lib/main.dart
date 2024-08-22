import 'package:expense_tracker/expense_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 142, 195, 239),
        title: const Text("Expense Tracker"),
      ),
      body: const ExpenseScreen(),
    ),
  ));
}
