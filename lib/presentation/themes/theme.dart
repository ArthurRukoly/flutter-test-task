import 'package:flutter/material.dart';

// 🎨 Discord Theme Colors
const Color discordBlue = Color(0xFF7289DA);
const Color discordDarkBlue = Color(0xFF5865F2);
const Color discordBackgroundDark = Color(0xFF36393F);
const Color discordBackgroundDarker = Color(0xFF2C2F33);
const Color discordTextDark = Colors.white;
const Color discordTextLight = Color(0xFF2C2F33);
const Color discordCardDark = Color(0xFF2C2F33);
const Color discordCardLight = Color(0xFFF6F6F6);
const Color discordHoverDark = Color(0xFF40444B);
const Color discordHoverLight = Color(0xFF99AAB5);

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: discordBlue,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: discordBlue,
    foregroundColor: Colors.white,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: discordTextLight),
    bodyMedium: TextStyle(color: discordTextLight),
  ),
  cardColor: discordCardLight,

  //  Focus & Hover Effects
  focusColor: discordDarkBlue,
  hoverColor: discordHoverLight,

  //  Text Field Focus
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(color: discordDarkBlue, width: 2.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(color: discordHoverLight, width: 2.5),
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: discordBlue,
  scaffoldBackgroundColor: discordBackgroundDark,
  appBarTheme: AppBarTheme(
    backgroundColor: discordBackgroundDarker,
    foregroundColor: Colors.white,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: discordTextDark),
    bodyMedium: TextStyle(color: discordTextDark),
  ),
  cardColor: discordCardDark,

  //  Focus & Hover Effects
  focusColor: discordDarkBlue,
  hoverColor: discordHoverDark,

  //  Text Field Focus
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(color: discordDarkBlue, width: 2.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(color: discordHoverDark, width: 2.5),
    ),
  ),
);
