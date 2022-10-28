import 'package:terapevt_console/answers.dart';

abstract class Question {
  String question;
  List<Answers> answers;

  Question({required this.answers, required this.question});
}

class QuestionImpl implements Question {
  QuestionImpl({required this.answers, required this.question});

  @override
  List<Answers> answers;

  @override
  String question;
}
