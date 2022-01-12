import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  final Function handleAddExpense;

  AddExpense(this.handleAddExpense);

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final titleController = TextEditingController();
  var _pickedDate = null;
  String _errors = "";

  final descriptionController = TextEditingController();

  var amountController = TextEditingController();

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) return;
      setState(() {
        _pickedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              "$_errors",
              style: const TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.red),
            ),
          ),
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
                labelText: "Title", icon: Icon(Icons.title)),
          ),
          TextField(
            controller: descriptionController,
            autocorrect: true,
            decoration: const InputDecoration(
                labelText: "Description", icon: Icon(Icons.description)),
          ),
          TextField(
              controller: amountController,
              decoration: const InputDecoration(
                  labelText: "Amount", icon: Icon(Icons.price_check_rounded)),
              keyboardType: TextInputType.number),
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.calendar_today),
                Text(_pickedDate == null
                    ? 'Please pick date'
                    : DateFormat.yMMMMd().format(_pickedDate)),
                TextButton(
                    onPressed: () => _presentDatePicker(),
                    child: const Text("Choose date"))
              ],
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              //check controller
              String attributError = "";
              if (titleController.text == "") attributError = "Title";
              if (descriptionController.text == "")
                attributError = "Description";
              if (amountController.text == "") attributError = "Amount";
              if (_pickedDate == null) attributError = "Date picked";

              if (attributError != "") {
                setState(() {
                  _errors = "$attributError cannot be empty!";
                });
                return;
              }
              //add expense
              widget.handleAddExpense(
                  titleController.text,
                  descriptionController.text,
                  double.parse(amountController.text),
                  _pickedDate);
              showAboutDialog(
                  context: context,
                  applicationName: "Successfully added!",
                  applicationLegalese: "",
                  applicationIcon: const Icon(Icons.done));
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
