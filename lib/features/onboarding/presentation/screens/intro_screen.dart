import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/utils/app_routes.dart';
import 'package:movies/features/onboarding/presentation/models/intro_screen_model.dart';
import 'package:movies/features/onboarding/presentation/provider/onboarding_provider.dart';
import 'package:movies/core/widgets/app_elevated_button.dart';
import 'package:provider/provider.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<IntroProvider>(
      create: (context) => IntroProvider(),
      child: Scaffold(
        body: Consumer<IntroProvider>(
          builder: (context, provider, child) {
            return PageView.builder(
              onPageChanged: (value) {
                provider.onPageChanged(value);
              },
              controller: provider.pageController,
              itemCount: IntroDetails.introDetails.length,
              itemBuilder: (context, index) {
                final IntroDetails currentIntro =
                    IntroDetails.introDetails[index];
                final bool isLast = provider.isLastPage;
                final bool isFirst = provider.isFirstPage;
                return Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        currentIntro.imagePath,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            currentIntro.color.withValues(alpha: 0),
                            currentIntro.color.withValues(alpha: 1),
                          ],
                          stops: const [0.15, 0.75],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: SafeArea(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.loginScreen.routeName,
                            );
                          },
                          child: Text(
                            "Skip",
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondary,
                                ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: FadeInUp(
                        curve: Curves.easeInOut,
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: AppColors.black,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                currentIntro.title,
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                    ),
                              ),
                              const SizedBox(height: 16),
                              if (!isLast)
                                Text(
                                  currentIntro.subtitle,
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                              const SizedBox(height: 16),
                              AppElevatedButton(
                                onPress: () {
                                  isLast
                                      ? Navigator.pushReplacementNamed(
                                          context,
                                          AppRoutes.loginScreen.routeName,
                                        )
                                      : provider.nextPage();
                                },
                                text: isLast ? "Finish" : "Next",
                                textColor: Theme.of(
                                  context,
                                ).colorScheme.onSecondary,
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.secondary,
                              ),
                              const SizedBox(height: 16),
                              if (!isFirst)
                                AppElevatedButton(
                                  onPress: () {
                                    provider.previousPage();
                                  },
                                  text: "Back",
                                  textColor: Theme.of(
                                    context,
                                  ).colorScheme.secondary,
                                  backgroundColor: Theme.of(
                                    context,
                                  ).colorScheme.onPrimary,
                                  borderSide: Theme.of(
                                    context,
                                  ).colorScheme.secondary,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
