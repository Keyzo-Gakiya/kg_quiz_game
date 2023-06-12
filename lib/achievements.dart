import 'package:flutter/material.dart';
import 'resources/constants.dart';

class AchievementsScreen extends StatelessWidget {
  final String achievementTitle;

  const AchievementsScreen({super.key, required this.achievementTitle});

  @override
  Widget build(BuildContext context) {
    return AchievementsStateful(title: achievementTitle);
  }
} // class AchievementsScreen

class AchievementsStateful extends StatefulWidget {
  final String title;

  const AchievementsStateful({super.key, required this.title});

  @override
  State<AchievementsStateful> createState() => _AchievementsStatefulState();
}

class _AchievementsStatefulState extends State<AchievementsStateful> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                widget.title,
                style: kGameModeTitleTextStyle,
              ),
            ),
            const Text('long-click on each one to learn how to unlock it!'),
          ],
        ),
      ),
    );
  }
}
