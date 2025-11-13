import 'package:flutter/material.dart';


// for demo the main and cross axis with row
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Container(width: 30, height: 20, color: Colors.blue,),
              Container(width: 40, height: 50, color: const Color.fromARGB(255, 25, 173, 32),),
              Container(width: 50, height: 30, color: const Color.fromARGB(255, 147, 192, 42),),
            ],
          ),
        ),
      )
    )
  );
}
