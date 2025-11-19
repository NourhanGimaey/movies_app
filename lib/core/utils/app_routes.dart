import 'package:flutter/material.dart';
import 'package:movies/presentation/onboarding/screens/intro_screen.dart';
import 'package:movies/presentation/onboarding/screens/onboarding_screen.dart';

enum AppRoutes {
  onboardingScreen('/'),
  introScreen('/intro_screen');

  final String routeName;
  const AppRoutes(this.routeName);

  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.onboardingScreen.routeName: (context) => const OnboardingScreen(),
    AppRoutes.introScreen.routeName: (context) => const IntroScreen(),
  };
}
