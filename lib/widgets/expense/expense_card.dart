import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseCard extends StatelessWidget {
  final int _id;
  final String _price;
  final String _title;
  final DateTime _at;

  final Function handleRemoveExpense;

  ExpenseCard(
      this._id, this._price, this._title, this._at, this.handleRemoveExpense);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
            backgroundColor: Theme.of(context).secondaryHeaderColor,
            child: FittedBox(fit: BoxFit.fill, child: Text("$_price")),
            radius: 25),
        title: Text(_title),
        subtitle: Text(DateFormat.yMMMd().format(_at)),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: () => handleRemoveExpense(_id),
        ),
      ),
    );
  }
}
