import 'package:flutter/material.dart';
import '../../model/quiz_model.dart';

class ResultScreen extends StatelessWidget {
  final Quiz quiz;
  final Player player;
  final VoidCallback onRestart;

  const ResultScreen({
    super.key,
    required this.quiz,
    required this.player,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate score in points
    final score = player.getScoreInPoint(quiz.questions);
    final totalScore = quiz.questions.fold<int>(
      0,
      (sum, question) => sum + question.points,
    );

    return Scaffold(
      backgroundColor: const Color(0xFF4FC3F7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  'You scored $score out of $totalScore !',
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                // Questions review container
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      ...List.generate(
                        quiz.questions.length,
                        (index) {
                          final question = quiz.questions[index];
                          final answer = player.answers[index];
                          final isCorrect = answer.isGood(question);

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.grey[50],
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.grey[300]!,
                                  width: 1,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: isCorrect ? Colors.green : Colors.red,
                                        radius: 16,
                                        child: Text(
                                          '${index + 1}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          question.title,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  ...question.choices.map((choice) {
                                    final isSelected = choice == answer.answerChoice;
                                    final isCorrectChoice = choice == question.goodChoice;
                                    
                                    Color textColor = Colors.black87;
                                    IconData? iconData;
                                    Color? iconColor;
                                    
                                    if (isCorrectChoice) {
                                      textColor = Colors.green;
                                      iconData = Icons.check;
                                      iconColor = Colors.green;
                                    } else if (isSelected && !isCorrect) {
                                      textColor = Colors.red;
                                      iconData = Icons.close;
                                      iconColor = Colors.red;
                                    }

                                    return Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                                      child: Row(
                                        children: [
                                          if (iconData != null)
                                            Icon(iconData, color: iconColor, size: 20)
                                          else
                                            const SizedBox(width: 20),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: Text(
                                              choice,
                                              style: TextStyle(
                                                color: textColor,
                                                fontWeight: (isSelected || isCorrectChoice) 
                                                    ? FontWeight.bold 
                                                    : FontWeight.normal,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: onRestart,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF4FC3F7),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 18,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    'Restart Quiz',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}