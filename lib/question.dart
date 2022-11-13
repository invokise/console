import 'package:terapevt_console/answers.dart';

abstract class Question {
  String question;
  List<Answers> answers;

  Question({required this.answers, required this.question});
}

class QuestionImpl implements Question {
  /// Контракт срабатывает при создании экземпляра. Проверка на существования
  /// вопросов и ответов
  QuestionImpl({required this.answers, required this.question})
      : assert(question.isNotEmpty),
        assert(answers.isNotEmpty);

  @override
  List<Answers> answers;

  @override
  String question;
}
