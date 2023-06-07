import 'package:flutter/material.dart';
import 'package:kg_quiz_game/UI/option_button.dart';
import 'package:kg_quiz_game/resources/constants.dart';

class GameScreen extends StatelessWidget {
  final String gameModeTitle;

  //const GameScreen({super.key});
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                widget.title,
                style: kGameModeTitleTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            const Text(
              'Geography',
              style: kCategoryTextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25.0,
            ),
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                'Singapore is a country in Europe and it is very beautiful',
                style: kGameQuestionTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 100.0,
            ),
            const OptionButton(buttonText: 'True', buttonColor: Colors.green),
            const OptionButton(buttonText: 'False', buttonColor: Colors.red),
          ],
        ),
      ),
    );
  }
}
