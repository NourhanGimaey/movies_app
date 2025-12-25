import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/dependency_injection/di.dart';
import 'package:movies/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:movies/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:movies/features/auth/presentation/screens/login_screen.dart';
import 'package:movies/features/auth/presentation/screens/register_screen.dart';
import 'package:movies/features/main_layout/presentation/main_layout.dart';
import 'package:movies/features/main_layout/presentation/movie_details/cubit/movie_details_cubit.dart';
import 'package:movies/features/main_layout/presentation/movie_details/presentation/movie_details_screen.dart';
import 'package:movies/features/onboarding/presentation/provider/intro_provider.dart';
import 'package:movies/features/onboarding/presentation/screens/intro_screen.dart';
import 'package:movies/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:provider/provider.dart';

enum AppRoutes {
  onboardingScreen('/'),
  introScreen('/intro_screen'),
  loginScreen('/login_screen'),
  registerScreen('/register_screen'),
  forgotPassword('/forgot_password_screen'),
  mainLayout('/main_layout'),
  movieDetailsScreen('/movie_details_screen');

  final String routeName;
  const AppRoutes(this.routeName);

  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.onboardingScreen.routeName: (context) => const OnboardingScreen(),

    AppRoutes.introScreen.routeName: (context) =>
        ChangeNotifierProvider<IntroProvider>(
          create: (context) => IntroProvider(),
          child: const IntroScreen(),
        ),

    AppRoutes.loginScreen.routeName: (context) => BlocProvider<AuthCubit>(
      create: (context) => getIt<AuthCubit>(),
      child: const LoginScreen(),
    ),
    AppRoutes.registerScreen.routeName: (context) => BlocProvider<AuthCubit>(
      create: (context) => getIt<AuthCubit>(),
      child: const RegisterScreen(),
    ),

    AppRoutes.forgotPassword.routeName: (context) => ForgotPasswordScreen(),

    AppRoutes.mainLayout.routeName: (context) => const MainLayout(),
    
    AppRoutes.movieDetailsScreen.routeName: (context) =>
        BlocProvider<MovieDetailsCubit>(
          create: (context) => getIt<MovieDetailsCubit>(),
          child: const MovieDetailsScreen(),
        ),
  };
}
