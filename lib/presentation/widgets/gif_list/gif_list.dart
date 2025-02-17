import 'package:flutter/material.dart';
import 'package:test_task_flutter/presentation/widgets/gif_list/gif_card.dart';

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
  return Scrollbar(
    controller: scrollController, // Attach the existing ScrollController
    thickness: 6.0, // Customize scrollbar thickness
    radius: Radius.circular(10), // Rounded edges for the scrollbar
    thumbVisibility: true, // Ensure scrollbar is always visible when scrolling
    child: LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          controller: scrollController,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200, 
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 1,
          ),
          padding: EdgeInsets.all(8.0),
          itemCount: gifs.length + 1, 
          itemBuilder: (context, index) {
            if (index == gifs.length) {
              return isLoadingMore ? Center(child: CircularProgressIndicator()) : SizedBox.shrink();
            }

            final gifData = gifs[index];
            return GifCard(gifData: gifData);
          },
        );
      },
    ),
  );
}
}
