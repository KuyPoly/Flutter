import 'dart:convert';
import 'package:flutter/services.dart';
import '../model/quiz_model.dart';

class StorageService {
  // Load quiz questions from JSON file
  static Future<Quiz> loadQuizQuestions() async {
    try {
      final String jsonString = await rootBundle.loadString('lib/QuizApp/data/quiz_question.json');
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);
      
      final questions = (jsonData['questions'] as List)
          .map((q) => Question.fromJson(q))
          .toList();
      
      print('Loaded ${questions.length} questions');
      return Quiz(questions: questions);
    } catch (e) {
      print('Error loading quiz questions: $e');
      rethrow;
    }
  }
}