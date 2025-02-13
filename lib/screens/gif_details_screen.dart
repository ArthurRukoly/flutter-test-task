import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_task_flutter/features/core/special_text.dart';

class GifDetailScreen extends StatelessWidget {
  final dynamic gifData;

  const GifDetailScreen({super.key, required this.gifData});

  @override
  Widget build(BuildContext context) {
    final String gifUrl = gifData['images']['fixed_height']['url'];
    final String gifTitle = gifData['title'];
    final String gifUsername = gifData['username'];
    final String gifRating = gifData['rating'];

    return Scaffold(
      appBar: AppBar(title: Text("GIF Previews")),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Align( // Ensures everything starts from the top
          alignment: Alignment.topCenter, 
          child: Column(
            mainAxisSize: MainAxisSize.min, // Keeps column compact
            mainAxisAlignment: MainAxisAlignment.start, // Aligns content to the top
            crossAxisAlignment: CrossAxisAlignment.center, // Centers content horizontally
            children: [
              CachedNetworkImage(
                imageUrl: gifUrl,
                fit: BoxFit.contain,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              SizedBox(height: 10), // Spacing
              SpecialText(text: gifTitle),
              SizedBox(height: 5),
              Text("by $gifUsername", textAlign: TextAlign.center),
              SizedBox(height: 5),
              Text(gifRating, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
