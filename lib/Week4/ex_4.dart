import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        padding: EdgeInsets.all(40),
        margin: EdgeInsets.all(50),
        child: Column(
          children: [
            CustomCard(text: 'OOP', color: Colors.blue[100]),
            CustomCard(text: 'DART', color: Colors.blue[300]),
            CustomCard(
              text: 'FLUTTER',
              gradient: LinearGradient(
                colors: [Colors.blue.shade300, Colors.blue.shade600],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class CustomCard extends StatelessWidget {
  final String text;
  final Color? color;
  final Gradient? gradient;
  const CustomCard({
    super.key,
    required this.text,
    this.color = Colors.blue,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: gradient,
        color: gradient == null ? color : null,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white, 
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,),
        ),
      ),
    );
  }
}
