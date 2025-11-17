import 'package:flutter/material.dart';

class NavigationViewModel extends ChangeNotifier {
  final scrollController = ScrollController();
  final sectionKeys = <String, GlobalKey>{
    'intro': GlobalKey(),
    'skills': GlobalKey(),
    'education': GlobalKey(),
    'projects': GlobalKey(),
    'contact': GlobalKey(),
    'experience': GlobalKey(),
    'achievements': GlobalKey(),
  };

  void scrollTo(String section) {
    final key = sectionKeys[section];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}
