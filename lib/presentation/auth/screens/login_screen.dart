import 'package:flutter/material.dart';
import 'package:movies/core/utils/app_assets.dart';
import 'package:movies/core/utils/app_routes.dart';
import 'package:movies/presentation/auth/provider/auth_provider.dart';
import 'package:movies/presentation/auth/widgets/app_text_form_field.dart';
import 'package:movies/presentation/widgets/app_elevated_button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthProvider>(
      create: (context) => AuthProvider(),
      child: Consumer<AuthProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            body: Form(
              key: _formKey,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.appLogo, width: 160),
                      AppTextFormField(
                        isEmail: true,
                        customKeyboardType: TextInputType.emailAddress,
                        customTextInputAction: TextInputAction.next,
                        customPrefixIcon: const Icon(Icons.email),
                        customLabel: "Email",
                        controller: provider.emailController,
                      ),
                      const SizedBox(height: 16),
                      AppTextFormField(
                        isPassword: true,
                        customKeyboardType: TextInputType.text,
                        customTextInputAction: TextInputAction.done,
                        customPrefixIcon: const Icon(Icons.lock_open_rounded),
                        customLabel: "Password",
                        controller: provider.passwordController,
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.forgotPassword.routeName,
                            );
                          },
                          child: Text(
                            "Forgot Password?",
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondary,
                                ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      AppElevatedButton(
                        onPress: () {
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.mainLayout.routeName,
                          );
                        },
                        text: "Login",
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.secondary,
                        textColor: Theme.of(context).colorScheme.onPrimary,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have account?",
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.registerScreen.routeName,
                              );
                            },
                            child: Text(
                              "Create Account",
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondary,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Theme.of(context).colorScheme.secondary,
                              thickness: 1,
                              indent: 26,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              "Or",
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondary,
                                  ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Theme.of(context).colorScheme.secondary,
                              thickness: 1,
                              endIndent: 26,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      AppElevatedButton(
                        onPress: () {},
                        text: "Login with Google",
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.secondary,
                        textColor: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
