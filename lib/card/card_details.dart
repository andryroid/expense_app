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
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(title,style:const TextStyle(fontSize: 18)),
                Text(at.day.toString()+' '+ at.month.toString()+' '+at.year.toString(),
                style: const TextStyle(color:Colors.grey,fontSize: 10,fontWeight: FontWeight.bold)),
              ],
            ),
            const Text('remove')
          ],
        ),
      ),
    );
  }
}
