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
      height: 80,
      child: Card(
        elevation: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:  [
            Text("Ar "+price.toString()),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Text(title),
                Text(at.day.toString()+' '+ at.month.toString()+' '+at.year.toString()),
              ],
            ),
            const Text('remove')
          ],
        ),
      ),
    );
  }
}
