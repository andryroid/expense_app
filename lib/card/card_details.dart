import 'package:flutter/material.dart';

class CardDetails extends StatelessWidget {
  final String title;
  final double price;
  final DateTime at;
  CardDetails.fromValue({
    required this.title,
    required this.price,
    required this.at
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children:  [
          Text(price.toString()),
          Column(
            children:  [
              Text(title),
              Text(at.day.toString()+' '+ at.month.toString()+' '+at.year.toString()),
            ],
          )
        ],
      ),
    );
  }
}
