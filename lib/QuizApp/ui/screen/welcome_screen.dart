import 'package:flutter/material.dart';
import '../../model/quiz_model.dart';

class WelcomeScreen extends StatelessWidget {
  final Quiz quiz;
  final VoidCallback onStart;
  
  const WelcomeScreen({
    super.key,
    required this.quiz,
    required this.onStart,
  });
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4FC3F7),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/quiz/quiz-logo.png',
              width: 150,
              height: 150,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.flutter_dash,
                  size: 150,
                  color: Colors.white,
                );
              },
            ),
            const SizedBox(height: 80),
            // Start Quiz button - uses callback instead of Navigator
            ElevatedButton(
              onPressed: onStart,
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
                'Start Quiz',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}