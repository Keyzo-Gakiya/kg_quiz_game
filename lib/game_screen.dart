import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  final String buTitle;

  //const GameScreen({super.key});
  const GameScreen({super.key, required this.buTitle});

  @override
  Widget build(BuildContext context) {
    return GameInterface(
      title: buTitle,
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
          children: [
            Text(widget.title),
            const Text('Hello 2'),
            const Text('Hello 3'),
          ],
        ),
      ),
    );
  }
}
