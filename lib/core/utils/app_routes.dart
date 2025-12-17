import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/dependency_injection/di.dart';
import 'package:movies/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:movies/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:movies/features/auth/presentation/screens/login_screen.dart';
import 'package:movies/features/auth/presentation/screens/register_screen.dart';
import 'package:movies/features/main_layout/presentation/main_layout.dart';
import 'package:movies/features/onboarding/presentation/screens/intro_screen.dart';
import 'package:movies/features/onboarding/presentation/screens/onboarding_screen.dart';

enum AppRoutes {
  onboardingScreen('/'),
  introScreen('/intro_screen'),
  loginScreen('/login_screen'),
  registerScreen('/register_screen'),
  forgotPassword('/forgot_password_screen'),
  mainLayout('/main_layout');

  final String routeName;
  const AppRoutes(this.routeName);

  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.onboardingScreen.routeName: (context) => const OnboardingScreen(),
    AppRoutes.introScreen.routeName: (context) => const IntroScreen(),

    AppRoutes.loginScreen.routeName: (context) => BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: const LoginScreen(),
    ),
    AppRoutes.registerScreen.routeName: (context) => BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: const RegisterScreen(),
    ),

    AppRoutes.forgotPassword.routeName: (context) => ForgotPasswordScreen(),
    AppRoutes.mainLayout.routeName: (context) => const MainLayout(),
  };
}
