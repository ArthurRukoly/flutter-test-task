import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:test_task_flutter/core/theme.dart';
import 'package:test_task_flutter/screens/search_screen.dart';

Future main() async{
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme, // Apply light theme
      darkTheme: darkTheme, // Apply dark theme
      themeMode: ThemeMode.dark, // System-based theme switching
      home: SearchScreen(),
    );
  }
}
