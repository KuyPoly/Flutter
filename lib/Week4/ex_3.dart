import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        padding: EdgeInsets.all(40),
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(40),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color:  Colors.blue[100],
            ),
                child: Center(
                  child: Text(
                    "OOP",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(40),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color:  Colors.blue[300],
            ),
                child: Center(
                  child: Text(
                    "DART",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      decoration: TextDecoration.none
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(40),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade300, Colors.blue.shade600],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
            ),
                child: Center(
                  child: Text(
                    "FLUTTER",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      decoration: TextDecoration.none
                    ),
                  ),
                ),
              ),
            ],
          ), 
        )
      )
    )
  );
}
