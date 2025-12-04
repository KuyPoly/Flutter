import 'package:flutter/material.dart';
import '../data/expense.dart';
import '../model/expense.dart';
import '../widget/expense.dart';
import '../widget/bottom_modal.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  List<Expense> get registeredExpenses => expenses;

  void _openAddExpenseModal() {
  showModalBottomSheet(
    context: context,
    builder: (ctx) => const ExpenseForm(),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ronan-The Best Expenses App",
        ),
        backgroundColor: Colors.blue[700],
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _openAddExpenseModal,
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue[100]
        ),
        child: ListView.builder(
          itemCount: registeredExpenses.length,
          itemBuilder: (context, index) {
            return ExpenseItem(expense: registeredExpenses[index]);
          },
        ),
      ),
    );
  }
}