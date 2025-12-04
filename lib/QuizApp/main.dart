import 'package:flutter/material.dart';
import 'model/quiz_model.dart';
import 'model/screen_state.dart';
import 'service/storage_service.dart';
import 'ui/screen/welcome_screen.dart';
import 'ui/screen/question_screen.dart';
import 'ui/screen/result_screen.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizScreen currentScreen = QuizScreen.welcome;
  Quiz? quiz;
  Player? currentPlayer;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _loadQuizData();
  }

  // Load quiz questions from JSON file
  Future<void> _loadQuizData() async {
    try {
      final loadedQuiz = await StorageService.loadQuizQuestions();
      
      setState(() {
        quiz = loadedQuiz;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to load quiz: $e';
        isLoading = false;
      });
    }
  }

  void startQuiz() {
    setState(() {
      currentPlayer = Player(name: 'Player 1');
      quiz!.addPlayer(currentPlayer!);
      currentScreen = QuizScreen.question;
    });
  }

  void showResults() {
    setState(() {
      currentScreen = QuizScreen.result;
    });
  }

  void restartQuiz() async {
    setState(() {
      isLoading = true;
      currentScreen = QuizScreen.welcome;
    });

    // Reload quiz from JSON
    await _loadQuizData();
    
    setState(() {
      currentPlayer = null;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: const Color(0xFF4FC3F7),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(color: Colors.white),
                SizedBox(height: 20),
                Text(
                  'Loading quiz...',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      );
    }

    if (errorMessage != null) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: const Color(0xFF4FC3F7),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, color: Colors.white, size: 64),
                  const SizedBox(height: 20),
                  Text(
                    errorMessage!,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        errorMessage = null;
                        isLoading = true;
                      });
                      _loadQuizData();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: Builder(
        builder: (context) {
          switch (currentScreen) {
            case QuizScreen.welcome:
              return WelcomeScreen(
                quiz: quiz!,
                onStart: startQuiz,
              );
            case QuizScreen.question:
              return QuestionScreen(
                quiz: quiz!,
                player: currentPlayer!,
                onFinished: showResults,
              );
            case QuizScreen.result:
              return ResultScreen(
                quiz: quiz!,
                player: currentPlayer!,
                onRestart: restartQuiz,
              );
          }
        },
      ),
    );
  }
}