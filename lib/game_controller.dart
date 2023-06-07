import 'quiz_question.dart';

class GameController {
  int _questionIndex = 0;

  final List<Question> _questionBank = [
    Question('Singapore is a country in Europe', 'Geography', false),
    Question(
        'The planets in the Solar System fit within the distance from Earth to the Moon',
        'Science',
        true),
    Question('Marilyn Monroe was born in 1978', 'Pop Culture', false),
  ];
} // class GameController
