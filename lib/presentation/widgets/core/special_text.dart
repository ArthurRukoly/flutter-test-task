import 'package:flutter/material.dart';

class SpecialText extends StatelessWidget {
  final String text;

  const SpecialText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
      return DefaultTextStyle(
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        child: Center(
          child: Text(text),
        ),
      );
  }
}