import 'package:flutter/material.dart';
import 'package:kg_quiz_game/resources/constants.dart';
import 'game_screen.dart';
import 'achievements.dart';

void main() {
  runApp(const Menu());
}

class Menu extends StatelessWidget {
  const Menu({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainMenu(),
    );
  }
}

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  void showInstructions(String gameMode, String instructions) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(gameMode),
        content: Text(instructions),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  } // showInstructions()

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('images/KG_Logo_2.png'),
            const Center(
              child: Text('Long-Press a button for Game Instructions'),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextButton(
                onLongPress: () {
                  showInstructions(
                      'Quick Quiz', 'Respond 10 Questions in a row');
                },
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GameScreen(
                        gameModeTitle: 'Quick Quiz',
                      ),
                    ),
                  );
                },
                style: kOptionButtonStyle.copyWith(
                  backgroundColor: const MaterialStatePropertyAll(Colors.green),
                ),
                child: const Text(
                  'Quick Quiz',
                  style: kMenuButtonTextStyle,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GameScreen(
                        gameModeTitle: 'Longest Run',
                      ),
                    ),
                  );
                },
                onLongPress: () {
                  showInstructions('Longest Run',
                      'Respond Questions until you get one wrong or exhaust all available ones');
                },
                style: kOptionButtonStyle.copyWith(
                  backgroundColor: const MaterialStatePropertyAll(Colors.blue),
                ),
                child: const Text(
                  'Longest Run',
                  style: kMenuButtonTextStyle,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AchievementsScreen(
                        achievementTitle: 'Achievements',
                      ),
                    ),
                  );
                },
                onLongPress: () {
                  showInstructions('Achievements',
                      'Consult which challenges you have completed and how to tackle new ones');
                },
                style: kOptionButtonStyle.copyWith(
                  backgroundColor:
                      const MaterialStatePropertyAll(Colors.orange),
                ),
                child: const Text(
                  'Achievements',
                  style: kMenuButtonTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
