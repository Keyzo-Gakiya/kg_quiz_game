import 'quiz_question.dart';

class GameController {
  final List<Question> _questionBank = [
    Question('Singapore is a country in Europe', 'Geography', false),
    Question(
        'The planets in the Solar System fit within the distance from Earth to the Moon',
        'Science',
        true),
    Question('Marilyn Monroe was born in 1926', 'Pop Culture', true),
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
    Question('Russia is bigger than Canada', 'Geography', true),
    Question('Albert Einstein was born in Germany', 'History', true),
    Question('\'LASER\' is an acronym', 'Science', true),
    Question('The original \'iPhone\' was released in 2007', 'History', true),
    Question('Apollo is the Roman god of Medicine', 'History', false),
    Question('Samuel L. Jackson has participated in more than 100 films',
        'Movies', true),
    Question('The RMS Titanic sunken in 1914', 'History', false),
    Question('Belonephobia is the fear of needles', 'Medicine', true),
    Question(
        'Micro-controllers include a CPU and input and output ports in the same package',
        'Science',
        true),
    Question(
        'Our planet\'s spin allow airplanes to travel faster when moving towards the West',
        'Geography',
        false),
  ];

  String getQuestionText(int index) =>
      _questionBank[index].questionText; // getQuestionText()

  String getQuestionCategory(int index) =>
      _questionBank[index].questionCategory; // getQuestionCategory()

  bool getQuestionAnswer(int index) =>
      _questionBank[index].questionAnswer; // getQuestionAnswer()

  bool questionsExhausted() => _questionBank.isEmpty;

  int getBankLength() => _questionBank.length;

  void removeQuestion(int questionIndex) {
    print('Question Index Removed: $questionIndex');
    _questionBank.removeAt(questionIndex);
  } // removeQuestion()
} // class GameController
