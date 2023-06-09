import 'quiz_question.dart';

class GameController {
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

  String getQuestionText(int index) =>
      _questionBank[index].questionText; // getQuestionText()

  String getQuestionCategory(int index) =>
      _questionBank[index].questionCategory; // getQuestionCategory()

  bool getQuestionAnswer(int index) =>
      _questionBank[index].questionAnswer; // getQuestionAnswer()

  int getBankLength() => _questionBank.length;

  // void nextQuestion() {
  //   do {
  //     _questionIndex = Random().nextInt(_questionBank.length);
  //   } while (_questionsAlreadyAsked.contains(_questionIndex));
  //
  //   _questionsAlreadyAsked.add(_questionIndex);
  // } // nextQuestion()
} // class GameController
