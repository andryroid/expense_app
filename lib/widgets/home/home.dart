import 'package:flutter/material.dart';
import 'package:flutter_main/widgets/expense/add_expense.dart';
import 'package:flutter_main/widgets/expense/chart.dart';
import '../../models/expense.dart';
import '../../widgets/expense/expense_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final amount = TextEditingController();
  final title = TextEditingController();
  final description = TextEditingController();
  // create expense object
  final List<Expense> expenses = [];

  //add expense
  void handleAddExpense(
      String title, String description, double amount, DateTime at) {
    setState(() {
      int newId = expenses.length + 1;
      expenses.add(Expense(newId, title, description, at, amount));
    });
  }

  // remove expense
  void handleRemoveExpense(int id) {
    setState(() {
      expenses.removeWhere((element) => element.getId() == id);
    });
  }

  //show modal sheet
  void showModalAction(BuildContext builder) {
    showModalBottomSheet(
        context: builder,
        builder: (_) {
          return AddExpense(handleAddExpense);
        });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          actions: [
            IconButton(
                onPressed: () => showModalAction(context),
                icon: const Icon(Icons.add))
          ],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [Text("Expense")],
          )),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            Chart(expenses),
            const SizedBox(height: 30),
            Container(
              child: ExpenseList(expenses, handleRemoveExpense),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalAction(context),
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
