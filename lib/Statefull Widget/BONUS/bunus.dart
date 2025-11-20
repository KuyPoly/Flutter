import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFAED581),
        body: Padding(
          padding: EdgeInsets.all(40),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScoreCard(title: 'My score in Flutter', initialScore: 7),
                SizedBox(height: 20),
                ScoreCard(title: 'My score in Dart', initialScore: 3),
                SizedBox(height: 20),
                ScoreCard(title: 'My score in React', initialScore: 10),
              ],
            ),
          ),
        ),
      ),
    ));

class ScoreCard extends StatefulWidget {
  final String title;
  final int initialScore;

  const ScoreCard({
    super.key,
    required this.title,
    this.initialScore = 0,
  });

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  late int score;

  @override
  void initState() {
    super.initState();
    score = widget.initialScore;
  }

  void increment() {
    if (score < 10) {
      setState(() {
        score++;
      });
    }
  }

  void decrement() {
    if (score > 0) {
      setState(() {
        score--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: decrement,
                icon: const Icon(Icons.remove),
                iconSize: 30,
              ),
              const SizedBox(width: 20),
              IconButton(
                onPressed: increment,
                icon: const Icon(Icons.add),
                iconSize: 30,
              ),
            ],
          ),
          const SizedBox(height: 15),
          Stack(
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              FractionallySizedBox(
                widthFactor: score / 10,
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}