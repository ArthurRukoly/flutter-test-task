import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GifDetailsCard extends StatelessWidget {
  final String gifUrl;

  const GifDetailsCard({super.key, required this.gifUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      shadowColor: Colors.black26,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          imageUrl: gifUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => Padding(
            padding: const EdgeInsets.all(20),
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error, size: 50, color: Colors.red),
        ),
      ),
    );
  }
}
