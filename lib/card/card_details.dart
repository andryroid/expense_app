import 'package:flutter/material.dart';

class CardDetails extends StatelessWidget {
  final String _title;
  final String _content;
  const CardDetails.fromValue(this._title,this._content);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(child: Text(_title),),
      alignment: Alignment.center,
      width: double.infinity,
      height: 25,
    );
  }
}
