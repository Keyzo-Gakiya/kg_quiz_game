import 'dart:math';

import 'quiz_question.dart';

class GameController {
  int _questionsAskedNo = 0;
  int _questionIndex = 0;

  final List<int> _questionsAlreadyAsked = [];

  final List<Question> _questionBank = [
    Question('Singapore is a country in Europe', 'Geography', false),
    Question(
        'The planets in the Solar System fit within the distance from Earth to the Moon',
        'Science',
        true),
    Question('Marilyn Monroe was born in 1978', 'Pop Culture', false),
    Question('The Cure is a Canadian band', 'Music', false),
    Question(
        'K.I.T.T. (Knight Rider) is a Pontiac TransAm', 'Television', true),
    Question('Goku is Namek in the \'Dragon Ball\' anime', 'Television', false),
    Question(
        'You can see the Great Wall of China from space', 'Geography', false),
  ];

  String getQuestionText() =>
      _questionBank[_questionIndex].questionText; // getQuestionText()

  String getQuestionCategory() =>
      _questionBank[_questionIndex].questionCategory;
  bool checkAnswer() => _questionBank[_questionIndex].questionAnswer;

  void nextQuestion() {
    do {
      _questionIndex = Random().nextInt(_questionBank.length);
    } while (_questionsAlreadyAsked.contains(_questionIndex));

    _questionsAlreadyAsked.add(_questionIndex);

    print('Selected Index: $_questionIndex');

    if (_questionsAlreadyAsked.length == _questionBank.length) {
      print('Game Finished');
      _questionsAlreadyAsked.clear();
    }
  } // nextQuestion()
} // class GameController
