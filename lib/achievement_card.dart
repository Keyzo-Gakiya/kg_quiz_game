import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AchievementCard extends StatefulWidget {
  const AchievementCard({
    super.key,
    required this.achievementLabel,
    required this.achievementID,
    required this.instructionsToUnlock,
  });

  final String achievementLabel, achievementID, instructionsToUnlock;

  @override
  State<AchievementCard> createState() => _AchievementCardState();
}

class _AchievementCardState extends State<AchievementCard> {
  Image achievementImage = Image.asset('images/locked_achievement.png');
  Color backgroundColor = Colors.grey.shade300;

  void unlockAchievement() async {
    final prefs = await SharedPreferences.getInstance();

    bool unlocked;

    prefs.getBool(widget.achievementID) != null
        ? unlocked = true
        : unlocked = false;

    if (unlocked) {
      setState(() {
        backgroundColor = Colors.blue.shade100;
        achievementImage = Image.asset('images/${widget.achievementID}.png');
      });
    }
  } // unlockAchievement()

  void showInstructions(String achievementTitle, String instructions) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(achievementTitle),
        content: Text(instructions),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Ok'),
          )
        ],
      ),
    );
  } // showInstructions()

  @override
  Widget build(BuildContext context) {
    unlockAchievement();

    return GestureDetector(
      onTap: () {
        showInstructions(widget.achievementLabel, widget.instructionsToUnlock);
      },
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          children: [
            Text(
              widget.achievementLabel,
              style: const TextStyle(fontSize: 20.0, fontFamily: 'Oswald'),
            ),
            Expanded(
              child: achievementImage,
            ),
          ],
        ),
      ),
    );
  }
}
