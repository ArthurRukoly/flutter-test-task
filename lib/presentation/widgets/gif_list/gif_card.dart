import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:test_task_flutter/data/services/navigator_service.dart';
import 'package:test_task_flutter/presentation/screens/gif_details_screen.dart';

class GifCard extends StatelessWidget {
  // final String gifUrl;
  final dynamic gifData;
  const GifCard({super.key, required this.gifData});

  @override
  Widget build(BuildContext context) {
    final gifUrl = gifData['images']['fixed_height']['url'];

    void _moveToDetails() {
      // Navigator.push(context, MaterialPageRoute(builder: (context) => GifDetailScreen(gifData: gifData)));
      navigationService.navigateToGifDetails(gifData);
    }

    return GestureDetector(
      onTap: _moveToDetails,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(15), // Ensures Card itself is rounded
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15), // Clips child content
          child: CachedNetworkImage(
            imageUrl: gifUrl,
            fit: BoxFit.cover, // Ensures image fills the container properly
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>
                Center(child: Icon(Icons.error)),
          ),
        ),
      ),
    );
  }
}
