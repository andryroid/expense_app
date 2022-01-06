import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  final Function handleAddExpense;

  AddExpense(this.handleAddExpense);

  @override
  State<AddExpense> createState() => _AddExpenseState(handleAddExpense);
}

class _AddExpenseState extends State<AddExpense> {
  final Function handleAddExpense;
  final titleController = TextEditingController();

  final descriptionController = TextEditingController();

  var amountController = TextEditingController();

  _AddExpenseState(this.handleAddExpense);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      child: Column(children: [
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
        FloatingActionButton(
            onPressed: () {
              //add expense
              handleAddExpense(titleController.text, descriptionController.text,
                  double.parse(amountController.text));
              showAboutDialog(
                  context: context,
                  applicationName: "Successfully added!",
                  applicationLegalese: "",
                  applicationIcon: const Icon(Icons.done));
            },
            child: const Icon(Icons.add_moderator_rounded))
      ]),
    );
  }
}