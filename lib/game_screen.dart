import 'package:flutter/material.dart';
import 'package:kg_quiz_game/game_controller.dart';
import 'package:kg_quiz_game/resources/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

class GameScreen extends StatelessWidget {
  final String gameModeTitle;

  const GameScreen({super.key, required this.gameModeTitle});

  @override
  Widget build(BuildContext context) {
    return GameInterface(
      title: gameModeTitle,
    );
  }
} // class GameScreen

class GameInterface extends StatefulWidget {
  final String title;

  const GameInterface({super.key, required this.title});

  @override
  State<GameInterface> createState() => _GameInterfaceState();
}

class _GameInterfaceState extends State<GameInterface> {
  GameController controller = GameController();
  int correctAnswers = 0, questionsAsked = 0;

  late int bankLength = controller.getBankLength();
  late int questionIndex;
  bool longestRunMode = false;
  List<int> questionsAlreadyAsked = [];

  @override
  void initState() {
    super.initState();
    changeQuestionIndex();

    widget.title == 'Longest Run'
        ? longestRunMode = true
        : longestRunMode = false;
  } // initState()

  void changeQuestionIndex() {
    int bankLengthMethod = controller.getBankLength();

    print('Bank Length in Method: ${controller.getBankLength()}');

    if (controller.getBankLength() == 0) {
      finishGame('run Ended', 'You finished the most amazing game ever!');
    }

    questionIndex = Random().nextInt(bankLengthMethod);
  } // changeQuestionIndex()

  void restartGame() {
    questionsAlreadyAsked.clear();
    correctAnswers = 0;
  } // restartGame()

  void finishGame(String alertTitle, String alertContent) {
    checkAchievements();

    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(alertTitle),
        content: Text(alertContent),
        actions: [
          TextButton(
            onPressed: () {
              restartGame();
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  } // finishGame()

  void checkAchievements() async {
    final prefs = await SharedPreferences.getInstance();

    // Complete One Quick Quiz
    if (!longestRunMode) {
      prefs.setBool('quick_0', true);
      print('quick 0 unlocked');
    }

    // Complete One Quick Quiz with 10 correct
    if (!longestRunMode && correctAnswers >= 10) {
      await prefs.setBool('quick_1', true);
      print('quick 1 unlocked');
    }

    // Complete a Longest Run with at least 20 correct answers
    if (longestRunMode && correctAnswers == 20) {
      await prefs.setBool('longest_20', true);
      print('longest 20 unlocked');
    }
  } // checkAchievements()

  String getQuestionText(int questionIndex) =>
      controller.getQuestionText(questionIndex); // getQuestionText()

  String getQuestionCategory(int questionIndex) =>
      controller.getQuestionCategory(questionIndex);

  bool getQuestionAnswer(int questionIndex) =>
      controller.getQuestionAnswer(questionIndex);

  void validateAnswer(bool answer) {
    if (longestRunMode) {
      print(controller.questionsExhausted());

      if (controller.questionsExhausted()) {
        finishGame('Well Done', 'Come back later');
      } else {
        if (getQuestionAnswer(questionIndex) == answer) {
          correctAnswers++;
        } else {
          finishGame(
              'Run Ended!', 'You answered $correctAnswers questions correctly');
        }
      }
    } else {
      if (getQuestionAnswer(questionIndex) == answer) {
        correctAnswers++;
      }
      if (controller.getBankLength() <= bankLength - 9) {
        finishGame('Quiz Completed',
            'You answered correctly $correctAnswers out of 10 questions!');
      }
    }

    controller.removeQuestion(questionIndex);

    setState(() {
      changeQuestionIndex();
    });
  } // validateAnswer()

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.title,
              style: kGameModeTitleTextStyle,
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: Center(
                child: Text(
                  getQuestionCategory(questionIndex),
                  style: kCategoryTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  getQuestionText(questionIndex),
                  style: kGameQuestionTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                onPressed: () {
                  validateAnswer(true);
                },
                style: kOptionButtonStyle.copyWith(
                  backgroundColor: const MaterialStatePropertyAll(Colors.green),
                ),
                child: Text(
                  'True',
                  style: kMenuButtonTextStyle.copyWith(fontSize: 40.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 30.0),
              child: TextButton(
                onPressed: () {
                  validateAnswer(false);
                },
                style: kOptionButtonStyle.copyWith(
                  backgroundColor: const MaterialStatePropertyAll(Colors.red),
                ),
                child: Text(
                  'False',
                  style: kMenuButtonTextStyle.copyWith(fontSize: 40.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
