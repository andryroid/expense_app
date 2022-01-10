import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../../models/expense.dart';
import './chart_element.dart';

class Chart extends StatelessWidget {
  final List<Expense> expenses;
  Chart(this.expenses);

  List<Map<String, Object>> get listTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double amountForThisWeek = 0;
      for (int i = 0; i < expenses.length; i++) {
        if (weekDay.day == expenses[i].getAt().day &&
            weekDay.month == expenses[i].getAt().month &&
            weekDay.year == expenses[i].getAt().year) {
          amountForThisWeek += double.parse(expenses[i].getAmount());
        }
      }
      return {
        'day': getWeekDay(weekDay.weekday),
        'amount': amountForThisWeek,
        'weekIndex': weekDay.weekday
      };
    });
  }

  String getWeekDay(int weekDay) {
    if (weekDay == 1) return 'Mon';
    if (weekDay == 2) return 'Thu';
    if (weekDay == 3) return 'Wed';
    if (weekDay == 4) return 'Thi';
    if (weekDay == 5) return 'Fri';
    if (weekDay == 6) return 'Sat';
    if (weekDay == 7) return 'Sun';
    return weekDay.toString();
  }

  double totalExpense() {
    double total = 0;
    expenses.forEach((element) {
      var dayDiff = DateTime.now().difference(element.getAt()).inDays;
      if (dayDiff <= 7) total += double.parse(element.getAmount());
    });
    return total;
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
              children: listTransactionValues.map((e) {
                final heighFactor = totalExpense() == 0
                    ? 0.0
                    : double.parse(e['amount'].toString()) / totalExpense();
                return ChartElement(
                    e['weekIndex'] as int,
                    e['day'].toString(),
                    e['amount'] as double,
                    double.parse(heighFactor.toString()));
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
