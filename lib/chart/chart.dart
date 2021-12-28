import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  final String _title;
  const Chart.fromValue(this._title);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(_title,style: const TextStyle(fontSize: 25,color: Colors.white),),
      width: double.infinity,
      color: Colors.indigoAccent,
    );
  }
}
