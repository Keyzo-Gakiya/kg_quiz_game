import 'package:flutter/material.dart';

const TextStyle kCategoryTextStyle = TextStyle(
  fontSize: 30.0,
);

const TextStyle kMenuButtonTextStyle = TextStyle(
    fontSize: 35.0,
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontFamily: 'Shadows');

ButtonStyle kOptionButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
  ),
);

const TextStyle kGameQuestionTextStyle =
    TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, fontFamily: 'Acme');

const TextStyle kGameModeTitleTextStyle = TextStyle(
  fontSize: 35.0,
  fontWeight: FontWeight.w700,
  fontFamily: 'Shadows',
);
