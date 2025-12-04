import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Question {
  final String id;
  final String title;
  final List<String> choices;
  final String goodChoice;
  final int points;

  Question({
    String? id,
    required this.title,
    required this.choices,
    required this.goodChoice,
    required this.points,
  }) : id = id ?? uuid.v4();

  // Create from JSON (needed for loading questions)
  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      title: json['title'],
      choices: List<String>.from(json['choices']),
      goodChoice: json['goodChoice'],
      points: json['points'],
    );
  }
}

class Answer {
  final String id;
  final String questionId;
  final String answerChoice;

  Answer({
    String? id,
    required this.questionId,
    required this.answerChoice,
  }) : id = id ?? uuid.v4();

  bool isGood(Question question) {
    return answerChoice == question.goodChoice;
  }
}

class Player {
  final String id;
  final String name;
  final List<Answer> answers;

  Player({
    String? id,
    required this.name,
    List<Answer>? answers,
  })  : id = id ?? uuid.v4(),
        answers = answers ?? [];

  void addAnswer(Answer answer) {
    answers.add(answer);
  }

  int getScoreInPercentage(List<Question> questions) {
    if (questions.isEmpty) return 0;
    final points = getScoreInPoint(questions);
    final totalPoints = questions.fold<int>(0, (sum, q) => sum + q.points);
    return ((points / totalPoints) * 100).round();
  }

  int getScoreInPoint(List<Question> questions) {
    int score = 0;
    for (int i = 0; i < answers.length && i < questions.length; i++) {
      if (answers[i].isGood(questions[i])) {
        score += questions[i].points;
      }
    }
    return score;
  }
}

class Quiz {
  final String id;
  final List<Question> questions;
  final List<Player> players;

  Quiz({
    String? id,
    List<Question>? questions,
    List<Player>? players,
  })  : id = id ?? uuid.v4(),
        questions = questions ?? [],
        players = players ?? [];

  void addPlayer(Player player) {
    players.add(player);
  }

  // Create from JSON (needed for loading questions)
  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'],
      questions: (json['questions'] as List)
          .map((q) => Question.fromJson(q))
          .toList(),
    );
  }
}