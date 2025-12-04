import 'package:flutter/material.dart';
import 'package:movies/core/utils/app_routes.dart';
import 'package:movies/presentation/auth/provider/auth_provider.dart';
import 'package:movies/presentation/auth/widgets/app_text_form_field.dart';
import 'package:movies/presentation/widgets/app_elevated_button.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthProvider>(
      create: (context) => AuthProvider(),
      child: Consumer<AuthProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Register",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            body: Form(
              key: _formKey,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppTextFormField(
                        isName: true,
                        customKeyboardType: TextInputType.text,
                        customTextInputAction: TextInputAction.next,
                        customPrefixIcon: const Icon(Icons.person),
                        customLabel: "Name",
                        controller: provider.nameController,
                      ),
                      const SizedBox(height: 24),
                      AppTextFormField(
                        isEmail: true,
                        customKeyboardType: TextInputType.emailAddress,
                        customTextInputAction: TextInputAction.next,
                        customPrefixIcon: const Icon(Icons.email),
                        customLabel: "Email",
                        controller: provider.emailController,
                      ),
                      const SizedBox(height: 24),
                      AppTextFormField(
                        isPassword: true,
                        customKeyboardType: TextInputType.text,
                        customTextInputAction: TextInputAction.done,
                        customPrefixIcon: const Icon(Icons.lock_open_rounded),
                        customLabel: "Password",
                        controller: provider.passwordController,
                      ),
                      const SizedBox(height: 24),
                      AppTextFormField(
                        isPassword: true,
                        customKeyboardType: TextInputType.text,
                        customTextInputAction: TextInputAction.done,
                        customPrefixIcon: const Icon(Icons.lock_open_rounded),
                        customLabel: "Confirm Password",
                        controller: provider.passwordController,
                      ),
                      const SizedBox(height: 24),
                      AppTextFormField(
                        isPhone: true,
                        customKeyboardType: TextInputType.number,
                        customTextInputAction: TextInputAction.next,
                        customPrefixIcon: const Icon(Icons.phone_iphone),
                        customLabel: "Phone Number",
                        controller: provider.phoneController,
                      ),
                      const SizedBox(height: 24),
                      AppElevatedButton(
                        onPress: () {},
                        text: "Create Account",
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.secondary,
                        textColor: Theme.of(context).colorScheme.onPrimary,
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have account?",
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.loginScreen.routeName,
                              );
                            },
                            child: Text(
                              "Login",
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
