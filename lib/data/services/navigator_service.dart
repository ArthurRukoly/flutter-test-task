import 'package:flutter/material.dart';
import 'package:test_task_flutter/presentation/screens/gif_details_screen.dart';
import 'package:test_task_flutter/presentation/screens/search_screen.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void navigateToGifDetails(Map<String, dynamic> gifData) {
    navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (context) => GifDetailScreen(gifData: gifData),
      ),
    );
  }

  void navigateToSearch(){
    navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (context) => SearchScreen(),
      ),
    );
  }

  // Go back
  void goBack() {
    navigatorKey.currentState?.pop();
  }
}

// Singleton instance
final NavigationService navigationService = NavigationService();
