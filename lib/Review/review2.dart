import 'dart:math';
import 'package:flutter/material.dart';

const diceImage = [
  'assets/dices/dice-1.png',
  'assets/dices/dice-2.png',
  'assets/dices/dice-3.png',
  'assets/dices/dice-4.png',
  'assets/dices/dice-5.png',
  'assets/dices/dice-6.png',
];

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  final random = Random();
  String activeDiceImage = diceImage[1]; 

  void rollDice() {
    final roll = random.nextInt(6); 
    setState(() {
      activeDiceImage = diceImage[roll];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: rollDice,
          child: Image.asset(
          activeDiceImage,
          width: 200,
        ),
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 28,
            ),
          ),
          child: const Text('Roll Dice'),
        ),
      ],
    );
  }
}

void main() => runApp(const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(child: DiceRoller()),
      ),
    ));