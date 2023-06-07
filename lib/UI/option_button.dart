import 'package:flutter/material.dart';
import 'package:kg_quiz_game/game_screen.dart';
import 'package:kg_quiz_game/resources/constants.dart';

class OptionButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;

  const OptionButton(
      {super.key, required this.buttonText, required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 10.0),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GameScreen(
                gameModeTitle: buttonText,
              ),
            ),
          );
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(buttonColor),
        ),
        child: Text(
          buttonText,
          style: kMenuButtonTextStyle,
        ),
      ),
    );
  }
} // class _MainMenuState
