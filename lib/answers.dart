abstract class Answers {
  String answerText;
  int answerPoints;

  Answers(this.answerPoints, this.answerText);
}

class AnswersImpl implements Answers {
  @override
  int answerPoints;

  @override
  String answerText;

  AnswersImpl({required this.answerPoints, required this.answerText});
}
