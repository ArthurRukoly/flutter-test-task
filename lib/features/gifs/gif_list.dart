import 'package:flutter/material.dart';
import 'gif_card.dart';
import '../../widgets/loading_indicator.dart';

class GifList extends StatelessWidget {
  final List<dynamic> gifs;
  final bool isLoadingMore;
  final ScrollController scrollController;

  const GifList({
    super.key,
    required this.gifs,
    required this.isLoadingMore,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController, // Attach ScrollController
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 GIFs per row
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 1, // Keeps GIFs square
      ),
      padding: EdgeInsets.all(8.0),
      itemCount: gifs.length + 1, // Add one extra for the loading indicator
      itemBuilder: (context, index) {
        if (index == gifs.length) {
          return isLoadingMore ? LoadingIndicator() : SizedBox.shrink();
        }

        final gifData = gifs[index];
        return GifCard(gifData: gifData);
      },
    );
  }
}
