import 'package:flutter/material.dart';
import 'package:flutter_main/widgets/expense/expense_card.dart';
import '../../models/expense.dart';

class ExpenseList extends StatelessWidget {
  final List<Expense> expenses;
  ExpenseList(this.expenses);
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) => ExpenseCard(
            DateTime.now().toString(),
            expenses[index].getAmount(),
            expenses[index].getTitle(),
            expenses[index].getAt()),
        itemCount: expenses.length);
  }
}
