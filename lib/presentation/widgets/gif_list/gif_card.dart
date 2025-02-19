import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:test_task_flutter/data/services/navigator_service.dart';

class GifCard extends StatelessWidget {
  final dynamic gifData;
  const GifCard({super.key, required this.gifData});

  @override
  Widget build(BuildContext context) {
    final gifUrl = gifData['images']['fixed_height']['url'];

    void moveToDetails() {
      navigationService.navigateToGifDetails(gifData);
    }

    return GestureDetector(
      onTap: moveToDetails,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(15),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15), 
          child: CachedNetworkImage(
            imageUrl: gifUrl,
            fit: BoxFit.cover, 
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
