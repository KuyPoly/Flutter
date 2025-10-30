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
              GradientButton(label: "Hello 1", startColor: Colors.blue, endColor: Colors.red),
              GradientButton(label: "Hello 2", startColor: Colors.blue, endColor: Colors.red),
              GradientButton(label: "Hello 3", startColor: Colors.blue, endColor: Colors.red),
            ],
          ), 
        )
      )
    )
  );
}

class GradientButton extends StatelessWidget{
  final String label;
  final Color startColor;
  final Color endColor;
  const GradientButton({super.key, required this.label, required this.startColor, required this.endColor});

  @override
  Widget build(BuildContext context) {
    return Container(
                padding: EdgeInsets.all(40),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    colors: <Color>[startColor, endColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
            ),
                child: Center(
                  child: Text(
                    label,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      decoration: TextDecoration.none
                    ),
                  ),
                ),
              );
  }
}
