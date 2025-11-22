import 'package:flutter/material.dart';
import 'package:movies/presentation/auth/screens/forgot_password_screen.dart';
import 'package:movies/presentation/auth/screens/login_screen.dart';
import 'package:movies/presentation/auth/screens/register_screen.dart';
import 'package:movies/presentation/onboarding/screens/intro_screen.dart';
import 'package:movies/presentation/onboarding/screens/onboarding_screen.dart';

enum AppRoutes {
  onboardingScreen('/'),
  introScreen('/intro_screen'),
  loginScreen('/login_screen'),
  registerScreen('/register_screen'),
  forgotPassword('/forgot_password_screen');

  final String routeName;
  const AppRoutes(this.routeName);

  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.onboardingScreen.routeName: (context) => const OnboardingScreen(),
    AppRoutes.introScreen.routeName: (context) => const IntroScreen(),
    AppRoutes.loginScreen.routeName: (context) => LoginScreen(),
    AppRoutes.registerScreen.routeName: (context) => RegisterScreen(),
    AppRoutes.forgotPassword.routeName: (context) => ForgotPasswordScreen(),
  };
}
