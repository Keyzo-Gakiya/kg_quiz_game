import 'package:flutter/material.dart';
import 'package:kg_quiz_game/resources/constants.dart';
import 'game_screen.dart';

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
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('images/KG_Logo_2.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextButton(
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
                      builder: (context) => const GameScreen(
                        gameModeTitle: 'Rewards',
                      ),
                    ),
                  );
                },
                style: kOptionButtonStyle.copyWith(
                  backgroundColor:
                      const MaterialStatePropertyAll(Colors.orange),
                ),
                child: const Text(
                  'Rewards',
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
