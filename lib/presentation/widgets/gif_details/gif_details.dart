import 'package:flutter/material.dart';

class GifDetails extends StatelessWidget {
  final String gifTitle;
  final String gifUsername;
  final String gifRating;
  final bool isCentered;

  const GifDetails({
    super.key,
    required this.gifTitle,
    required this.gifUsername,
    required this.gifRating,
    required this.isCentered,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isCentered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          gifTitle,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white70),
          textAlign: isCentered ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: isCentered ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            Icon(Icons.person, color: Colors.grey),
            const SizedBox(width: 5),
            Text(
              gifUsername,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            "Rating: $gifRating",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.deepPurple),
          ),
        ),
      ],
    );
  }
}
