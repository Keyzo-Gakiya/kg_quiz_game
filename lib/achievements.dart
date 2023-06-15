import 'package:flutter/material.dart';
import 'resources/constants.dart';
import 'achievement_card.dart';

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
            const Text('Tap on an achievement to learn how to unlock it!'),
            const SizedBox(
              height: 30.0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  children: const [
                    AchievementCard(
                      achievementLabel: 'First Game',
                      achievementID: 'quick_0',
                      instructionsToUnlock: 'Complete a Quick Quiz Game',
                    ),
                    AchievementCard(
                      achievementLabel: 'All Correct',
                      achievementID: 'quick_1',
                      instructionsToUnlock:
                          'Correctly Respond all Questions in a Quick Quiz',
                    ),
                    AchievementCard(
                      achievementLabel: 'Marathon',
                      achievementID: 'longest_21',
                      instructionsToUnlock:
                          'Correctly respond at least 21 Questions in a Longest Run',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
