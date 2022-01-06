import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {
  final String _id;
  final String _price;
  final String _title;
  final DateTime _at;

  ExpenseCard(this._id, this._price, this._title, this._at);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        height: 50,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).secondaryHeaderColor, width: 2)),
            height: 35,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Ar $_price",
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_title),
              Text(
                _at.toString(),
                style: const TextStyle(color: Colors.grey),
              )
            ],
          ),
          const Text('remove')
        ]),
      ),
    );
  }
}
