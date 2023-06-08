import 'dart:math';

import 'quiz_question.dart';

class GameController {
  int _questionsAskedNo = 0;
  late int _questionIndex;

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
    Question('Mexico is located in South America', 'Geography', false),
    Question('Pearl Jam is from Guatemala', 'Music', false),
    Question('Computers work with binary code', 'Science', true),
    Question('Some vipers or snakes can see infrared', 'Biology', true),
    Question('Elon Musk was born in South Africa', 'Politics', true),
  ];

  String getQuestionText() =>
      _questionBank[_questionIndex].questionText; // getQuestionText()

  String getQuestionCategory() =>
      _questionBank[_questionIndex].questionCategory;

  bool getQuestionAnswer() => _questionBank[_questionIndex].questionAnswer;

  void startGame() {
    _questionIndex = Random().nextInt(_questionBank.length);
    _questionsAlreadyAsked.add(_questionIndex);
  }

  void restartGame() {
    _questionsAskedNo = 0;
  } // restartGame()

  bool gameFinished() => _questionsAskedNo >= 9 ? true : false;

  void nextQuestion() {
    do {
      _questionIndex = Random().nextInt(_questionBank.length);
    } while (_questionsAlreadyAsked.contains(_questionIndex));

    _questionsAlreadyAsked.add(_questionIndex);

    print('Selected Index: $_questionIndex');

    _questionsAskedNo++;

    if (_questionsAlreadyAsked.length == _questionBank.length) {
      print('Game Finished');
      _questionsAlreadyAsked.clear();
    }
  } // nextQuestion()
} // class GameController
