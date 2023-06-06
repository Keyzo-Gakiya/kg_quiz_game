import 'package:flutter/material.dart';
import 'UI/main_menu_button.dart';

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
            const MainMenuButton(
              buttonText: 'Quick Quiz',
              buttonColor: Colors.green,
            ),
            const MainMenuButton(
              buttonText: 'Longest Run',
              buttonColor: Colors.blue,
            ),
            const MainMenuButton(
              buttonText: 'Rewards',
              buttonColor: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
