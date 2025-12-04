import 'package:flutter/material.dart';
import '../../model/quiz_model.dart';

class QuestionScreen extends StatefulWidget {
  final Quiz quiz;
  final Player player;
  final VoidCallback onFinished;
  
  const QuestionScreen({
    super.key,
    required this.quiz,
    required this.player,
    required this.onFinished,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;
  bool _isAnswering = false;

  Question get currentQuestion => widget.quiz.questions[currentQuestionIndex];
  
  bool get isLastQuestion => currentQuestionIndex == widget.quiz.questions.length - 1;

  void selectAnswer(String selectedChoice) {
    if (_isAnswering) return;
    
    setState(() {
      _isAnswering = true;
    });

    final answer = Answer(
      questionId: currentQuestion.id,
      answerChoice: selectedChoice,
    );
    
    widget.player.addAnswer(answer);

    Future.delayed(const Duration(milliseconds: 300), () {
      if (!mounted) return;
      
      if (isLastQuestion) {
        widget.onFinished(); // Use callback instead of Navigator
      } else {
        setState(() {
          currentQuestionIndex++;
          _isAnswering = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4FC3F7),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Question text
                Text(
                  currentQuestion.title,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 60),
                // Answer choices
                ...currentQuestion.choices.map((choice) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        onPressed: _isAnswering ? null : () => selectAnswer(choice),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.grey[700],
                          disabledBackgroundColor: Colors.grey[300],
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 3,
                        ),
                        child: Text(
                          choice,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}