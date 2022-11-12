import 'dart:isolate';

import 'package:terapevt_console/answers.dart';
import 'package:terapevt_console/question.dart';
import 'dart:io';

abstract class Terapevt {
  int totalPoints;
  void runApp();
  Future<void> spawnIsolateToRunApp();

  Terapevt(this.totalPoints);
}

class TerapevtImpl implements Terapevt {
  @override
  int totalPoints = 0;

  @override
  String toString() {
    return '\x1B[33mСостояние объекта: $totalPoints\x1B[0m';
  }

  @override
  Future<void> spawnIsolateToRunApp() async {
    final mainReseivePort = ReceivePort();
    await Isolate.spawn(_createdIsolate, mainReseivePort.sendPort);
  }

  void _createdIsolate(SendPort mainSendPort) {
    runApp();
  }

  @override
  void runApp() {
    var firstAnswerForFirstQuestion =
        AnswersImpl(answerPoints: 3, answerText: 'Да');
    var secondAnswerForFirstQuestion =
        AnswersImpl(answerPoints: -3, answerText: 'Нет');
    var thirdAnswerForFirstQuestion =
        AnswersImpl(answerPoints: 0, answerText: 'Не помню');

    var firstQuestion = QuestionImpl(answers: [
      firstAnswerForFirstQuestion,
      secondAnswerForFirstQuestion,
      thirdAnswerForFirstQuestion
    ], question: 'Болела ли у вас голова в последнии 5 дней?');

    var firstAnswerForSecondQuestion =
        AnswersImpl(answerPoints: 3, answerText: 'Да');
    var secondAnswerForSecondQuestion =
        AnswersImpl(answerPoints: -3, answerText: 'Нет');
    var thirdAnswerForSecondQuestion =
        AnswersImpl(answerPoints: 0, answerText: 'Не помню');

    var secondQuestion = QuestionImpl(answers: [
      firstAnswerForSecondQuestion,
      secondAnswerForSecondQuestion,
      thirdAnswerForSecondQuestion
    ], question: 'Был ли у вас насморк в последнии 5 дней?');

    var firstAnswerForThirdQuestion =
        AnswersImpl(answerPoints: 3, answerText: 'Да');
    var secondAnswerForThirdQuestion =
        AnswersImpl(answerPoints: -3, answerText: 'Нет');
    var thirdAnswerForThirdQuestion =
        AnswersImpl(answerPoints: 0, answerText: 'Не помню');

    var thirdQuestion = QuestionImpl(answers: [
      firstAnswerForThirdQuestion,
      secondAnswerForThirdQuestion,
      thirdAnswerForThirdQuestion
    ], question: 'Ломило ли у вас конечности в последнии 5 дней?');

    while (true) {
      print(firstQuestion.question);
      print('1) ${firstQuestion.answers[0].answerText}');
      print('2) ${firstQuestion.answers[1].answerText}');
      print('3) ${firstQuestion.answers[2].answerText}');
      stdout.write('Ваш ответ:');
      var firstLine = stdin.readLineSync();

      if (firstLine != null && firstLine.isNotEmpty) {
        var answer = int.tryParse(firstLine);
        if (answer != null && (answer == 1 || answer == 2 || answer == 3)) {
          totalPoints += firstQuestion.answers[answer - 1].answerPoints;
          print('$this \n');
        } else {
          print('\x1B[31mВы ввели некорректный ответ!\x1B[0m');
          print('$this \n');
          continue;
        }
      } else {
        print('\x1B[31mВы не ответили на вопрос!\x1B[0m');
        print('$this \n');
        continue;
      }

      print(secondQuestion.question);
      print('1) ${secondQuestion.answers[0].answerText}');
      print('2) ${secondQuestion.answers[1].answerText}');
      print('3) ${secondQuestion.answers[2].answerText}');
      stdout.write('Ваш ответ:');
      var secondLine = stdin.readLineSync();
      if (secondLine != null && secondLine.isNotEmpty) {
        var answer = int.tryParse(secondLine);
        if (answer != null && (answer == 1 || answer == 2 || answer == 3)) {
          totalPoints += secondQuestion.answers[answer - 1].answerPoints;
          print('$this \n');
        } else {
          print('\x1B[31mВы ввели некорректный ответ!\x1B[0m');
          print('$this \n');
          continue;
        }
      } else {
        print('\x1B[31mВы не ответили на вопрос!\x1B[0m');
        print('$this \n');
        continue;
      }

      print(thirdQuestion.question);
      print('1) ${thirdQuestion.answers[0].answerText}');
      print('2) ${thirdQuestion.answers[1].answerText}');
      print('3) ${thirdQuestion.answers[2].answerText}');
      stdout.write('Ваш ответ:');
      var thirdLine = stdin.readLineSync();
      if (thirdLine != null && thirdLine.isNotEmpty) {
        var answer = int.tryParse(thirdLine);
        if (answer != null && (answer == 1 || answer == 2 || answer == 3)) {
          totalPoints += thirdQuestion.answers[answer - 1].answerPoints;
          print('$this \n');
        } else {
          print('\x1B[31mВы ввели некорректный ответ!\x1B[0m');
          print('$this \n');
          continue;
        }
      } else {
        print('\x1B[31mВы не ответили на вопрос!\x1B[0m');
        print('$this \n');
        continue;
      }

      print('Ваш результат: $totalPoints');
      print('\x1B[34mНачинаем приложение с начала.\x1B[0m');
      totalPoints = 0;
      print('$this \n');
    }
  }
}
