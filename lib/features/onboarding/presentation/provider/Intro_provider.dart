import 'package:flutter/material.dart';
import 'package:movies/features/onboarding/data/models/intro_screen_model.dart';

class IntroProvider extends ChangeNotifier {
  int currentPageIndex = 0;
  final PageController pageController = PageController();
  bool get isFirstPage => currentPageIndex == 0;
  bool get isLastPage =>
      currentPageIndex == IntroDetails.introDetails.length - 1;

  void onPageChanged(int index) {
    currentPageIndex = index;
    notifyListeners();
  }

  void nextPage() {
    if (!isLastPage) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    if (!isFirstPage) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
