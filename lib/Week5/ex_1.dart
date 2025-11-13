import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsetsGeometry.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HobbyCard(title: "Traveling", icon: Icons.travel_explore, bgColor: Colors.green),
              HobbyCard(title: "Skating", icon: Icons.skateboarding, bgColor: Colors.blue.shade900),
              HobbyCard(title: "Reading", icon: Icons.book, bgColor: Colors.yellow,),
            ],
          ),
          )
      )
    )
  );
}

class HobbyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? bgColor;

  const HobbyCard({
    super.key,
    required this.title,
    required this.icon,
    this.bgColor = Colors.blue
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Center(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
              icon,
              color: Colors.white,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none
              ),
            ),
          ],
        ),
      ),
    );
  }
}
