import 'package:flutter/material.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {


  void onCloseModal() {
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(decoration: InputDecoration(labelText: "Title"),),
          TextField(decoration: InputDecoration(labelText: "Price"),),
          ElevatedButton(
              onPressed: onCloseModal,
              child: Text("Close Modal"),
            ),
        ],
      ),
    );
  }
}