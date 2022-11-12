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

  /// Контракт срабатывает при создании экземпляра. Проверка получения
  /// минимального и максимального количества очков за вопрос.
  AnswersImpl({required this.answerPoints, required this.answerText})
      : assert(answerPoints > -4),
        assert(answerPoints < 4);
}
