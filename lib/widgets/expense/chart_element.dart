import 'package:flutter/material.dart';

class ChartElement extends StatelessWidget {
  final String label;
  final double amount;
  final double heighFactor;

  ChartElement(this.label, this.amount, this.heighFactor);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(amount.toString()),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 100,
            width: 15,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 1.0)),
                ),
                FractionallySizedBox(
                  heightFactor: heighFactor,
                  child: Container(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(label)
        ],
      ),
    );
  }
}
