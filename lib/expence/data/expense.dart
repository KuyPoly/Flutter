import '../model/expense.dart';

final List<Expense> expenses = [
  Expense(
    title: 'Lunch at Restaurant',
    amount: 15.50,
    date: DateTime(2024, 11, 28),
    category: Category.food,
  ),
  Expense(
    title: 'Coffee Shop',
    amount: 4.75,
    date: DateTime(2024, 11, 29),
    category: Category.food,
  ),
  Expense(
    title: 'Flight to Paris',
    amount: 450.00,
    date: DateTime(2024, 11, 25),
    category: Category.travel,
  ),
  Expense(
    title: 'Hotel Booking',
    amount: 120.00,
    date: DateTime(2024, 11, 26),
    category: Category.travel,
  ),
  Expense(
    title: 'Movie Tickets',
    amount: 24.00,
    date: DateTime(2024, 11, 27),
    category: Category.leisure,
  ),
  Expense(
    title: 'Concert',
    amount: 85.00,
    date: DateTime(2024, 11, 20),
    category: Category.leisure,
  ),
  Expense(
    title: 'Office Supplies',
    amount: 65.30,
    date: DateTime(2024, 11, 22),
    category: Category.work,
  ),
  Expense(
    title: 'Business Lunch',
    amount: 42.00,
    date: DateTime(2024, 11, 23),
    category: Category.work,
  ),
  Expense(
    title: 'Grocery Shopping',
    amount: 85.20,
    date: DateTime(2024, 11, 30),
    category: Category.food,
  ),
  Expense(
    title: 'Taxi Ride',
    amount: 18.50,
    date: DateTime(2024, 11, 24),
    category: Category.travel,
  ),
];