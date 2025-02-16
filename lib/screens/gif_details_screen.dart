import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for clipboard

class GifDetailScreen extends StatelessWidget {
  final dynamic gifData;

  const GifDetailScreen({super.key, required this.gifData});

  @override
  Widget build(BuildContext context) {
    final String gifUrl = gifData['images']['fixed_height']['url'];
    final String gifTitle = gifData['title'];
    final String gifUsername = gifData['username'].isNotEmpty ? gifData['username'] : "Unknown";
    final String gifRating = gifData['rating'].toUpperCase();

    return Scaffold(
      appBar: AppBar(
        title: Text("GIF Preview")
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: orientation == Orientation.portrait
                  ? _buildPortraitView(gifUrl, gifTitle, gifUsername, gifRating)
                  : _buildLandscapeView(gifUrl, gifTitle, gifUsername, gifRating),
            ),
          );
        },
      ),

      // Floating action button to copy GIF URL
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Clipboard.setData(ClipboardData(text: gifUrl)); // Copy to clipboard
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("GIF URL copied to clipboard!"),
              duration: Duration(seconds: 2),
            ),
          );
        },
        label: Text("Copy Link"),
        icon: Icon(Icons.copy),
        backgroundColor: Colors.deepPurple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  // Portrait Mode Layout
  Widget _buildPortraitView(String gifUrl, String gifTitle, String gifUsername, String gifRating) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildGifCard(gifUrl),
        const SizedBox(height: 15),
        _buildGifDetails(gifTitle, gifUsername, gifRating, true),
      ],
    );
  }

  // Landscape Mode Layout (GIF and Details Side by Side)
  Widget _buildLandscapeView(String gifUrl, String gifTitle, String gifUsername, String gifRating) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: _buildGifCard(gifUrl)), // GIF on the left
        const SizedBox(width: 20),
        Expanded(flex: 3, child: _buildGifDetails(gifTitle, gifUsername, gifRating, false)), // Details on the right
      ],
    );
  }

  // GIF Card Widget
  Widget _buildGifCard(String gifUrl) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
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

  // GIF Details Widget (Title, Username, Rating)
  Widget _buildGifDetails(String gifTitle, String gifUsername, String gifRating, bool isProfile) {
    return Column(
      crossAxisAlignment: (isProfile ? CrossAxisAlignment.center : CrossAxisAlignment.start),
      children: [
        // Title
        Text(
          gifTitle,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white70,
          ),
          textAlign: (isProfile ? TextAlign.center : TextAlign.start),
        ),
        const SizedBox(height: 10),

        // Username
        Row(
          mainAxisAlignment: (isProfile ? MainAxisAlignment.center : MainAxisAlignment.start),
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

        // Rating Badge
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
