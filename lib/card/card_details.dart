import 'package:flutter/material.dart';

class CardDetails extends StatelessWidget {
  final String title;
  final String price;
  final String at;
  CardDetails.fromValue({
    required this.title,
    required this.price,
    required this.at
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children:  [
          Text(price),
          Column(
            children:  [
              Text(title),
              Text(at),
            ],
          )
        ],
      ),
    );
  }
}
