import 'package:flutter/material.dart';
import 'package:kg_quiz_game/game_controller.dart';
import 'package:kg_quiz_game/resources/constants.dart';

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
  int correctAnswers = 0;

  @override
  void initState() {
    super.initState();
    controller.startGame();
  }

  void validateAnswer(bool answer) {
    setState(() {
      if (controller.gameFinished()) {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Game Finished'),
            content: Text('You got $correctAnswers out of 10 correct answers'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'Ok');
                  correctAnswers = 0;
                  controller.restartGame();
                },
                child: const Text('Ok'),
              ),
            ],
          ),
        );
        print('The game has ended');
      } else {
        if (controller.getQuestionAnswer() == answer) {
          correctAnswers++;
          print('Correct! $correctAnswers');
        } else {
          print('Wrong!');
        }
      }
    });
    controller.nextQuestion();
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
                  controller.getQuestionCategory(),
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
                  controller.getQuestionText(),
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
