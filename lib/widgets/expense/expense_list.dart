import 'package:flutter/material.dart';
import 'package:flutter_main/widgets/expense/expense_card.dart';
import '../../models/expense.dart';

class ExpenseList extends StatelessWidget {
  final List<Expense> expenses;
  final Function handleRemoveExpense;
  ExpenseList(this.expenses, this.handleRemoveExpense);
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
          itemBuilder: (context, index) => ExpenseCard(
                expenses[index].getId(),
                expenses[index].getAmount(),
                expenses[index].getTitle(),
                expenses[index].getAt(),
                handleRemoveExpense,
              ),
          itemCount: expenses.length),
    );
  }
}
