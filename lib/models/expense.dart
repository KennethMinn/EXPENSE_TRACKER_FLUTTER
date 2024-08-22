import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final DateFormat formatter = DateFormat.yMd();

enum Category { food, leisure, travel, work }

// const categoryIcons ={
//   Category.food : Icons.lunch_dining,
//   Category.leisure : Icons.movie,
//   Category.travel :Icons.flight,
//   Category.work : Icons.work
// }

final Map<Category, IconData> categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.movie,
  Category.travel: Icons.flight,
  Category.work: Icons.work
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4(); //initializer list

  String get formattedDate {
    return formatter.format(date);
  }
}
