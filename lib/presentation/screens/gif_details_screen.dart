import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_task_flutter/data/services/navigator_service.dart';
import 'package:test_task_flutter/presentation/widgets/gif_details/gif_details.dart';
import 'package:test_task_flutter/presentation/widgets/gif_details/gif_details_card.dart';

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
      appBar: AppBar(title: Text("GIF Preview")),
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
      floatingActionButton: _buildFloatingActionButton(context, gifUrl),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildPortraitView(String gifUrl, String gifTitle, String gifUsername, String gifRating) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GifDetailsCard(gifUrl: gifUrl),
        const SizedBox(height: 15),
        GifDetails(gifTitle: gifTitle, gifUsername: gifUsername, gifRating: gifRating, isCentered: true),
      ],
    );
  }

  Widget _buildLandscapeView(String gifUrl, String gifTitle, String gifUsername, String gifRating) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: GifDetailsCard(gifUrl: gifUrl)), // GIF on the left
        const SizedBox(width: 20),
        Expanded(flex: 3, child: GifDetails(gifTitle: gifTitle, gifUsername: gifUsername, gifRating: gifRating, isCentered: false)),
      ],
    );
  }

  Widget _buildFloatingActionButton(BuildContext context, String gifUrl) {
    return FloatingActionButton.extended(
      onPressed: () {
        Clipboard.setData(ClipboardData(text: gifUrl)); // Copy to clipboard
        ScaffoldMessenger.of(navigationService.navigatorKey.currentContext!).showSnackBar(
          SnackBar(content: Text("GIF URL copied to clipboard!"), duration: Duration(seconds: 2)),
        );
      },
      label: Text("Copy Link"),
      icon: Icon(Icons.copy),
      backgroundColor: Colors.deepPurple,
    );
  }
}