class Expense {
  final String _title;
  final String _description;
  final DateTime _at;
  final double _amount;
  Expense(this._title, this._description, this._at, this._amount);

  String getTitle() {
    return _title;
  }

  String getDescription() {
    return _description;
  }

  DateTime getAt() {
    return _at;
  }

  String getAmount() {
    return _amount.toString();
  }
}
