import 'package:flutter/material.dart';
import 'ui/groceries/grocery_list.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Groceries',
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 205, 212, 129), 
          brightness: Brightness.light, 
          surface: const Color.fromARGB(255, 151, 228, 153)
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 214, 241, 215),
        textTheme: GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme),
      ),
      home: const GroceryList(),
    );
  }
}