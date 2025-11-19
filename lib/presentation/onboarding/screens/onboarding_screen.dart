import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/utils/app_assets.dart';
import 'package:movies/core/utils/app_routes.dart';
import 'package:movies/presentation/widgets/app_elevated_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset(AppImages.onboardingBG)),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.black.withValues(alpha: 0),
                  AppColors.black.withValues(alpha: 50),
                  AppColors.black.withValues(alpha: 91),
                  AppColors.black.withValues(alpha: 100),
                ],
                stops: [0, 39, 68, 100],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Spacer(),
                  Text(
                    "Find Your Next\nFavorite Movie Here",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Get access to a huge library of movies to suit all tastes. You will surely like it.",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withAlpha(60),
                    ),
                  ),
                  SizedBox(height: 16),
                  AppElevatedButton(
                    onPress: () {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.introScreen.routeName,
                      );
                    },
                    text: "Explore Now",
                    textColor: Theme.of(context).colorScheme.onSecondary,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
