import 'package:flutter/material.dart';
import 'resources/constants.dart';

void main() {
  runApp(const Menu());
}

class Menu extends StatelessWidget {
  const Menu({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const MainMenu(),
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
    return const Material(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Hello'),
            Text('Hello'),
            Text('Hello'),
            Text('Hello'),
            MainMenuButton(buttonText: 'Quick Quiz'),
            MainMenuButton(buttonText: 'Longest Run'),
            MainMenuButton(buttonText: 'Rewards'),
          ],
        ),
      ),
    );
  }
}

class MainMenuButton extends StatelessWidget {
  final String buttonText;

  const MainMenuButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 10.0),
      child: TextButton(
        onPressed: () {},
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.green),
        ),
        child: Text(
          buttonText,
          style: kMenuButtonTextStyle,
        ),
      ),
    );
  }
} // class _MainMenuState
