import 'package:flutter/material.dart';
import '../../models/expense.dart';
import './chart_element.dart';

class Chart extends StatelessWidget {
  final List<Expense> expenses;
  Chart(this.expenses);

  double getAmountExpense(String type) {
    var sum = 0;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(5),
      child: Container(
        alignment: Alignment.center,
        height: 180,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Weekly expense'),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ChartElement("M", 10, 0.4),
                ChartElement("T", 10, 0.2),
                ChartElement("M", 10, 0.4),
                ChartElement("T", 10, 0.2),
                ChartElement("M", 10, 0.4),
                ChartElement("T", 10, 0.2),
                ChartElement("M", 10, 0.4)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
