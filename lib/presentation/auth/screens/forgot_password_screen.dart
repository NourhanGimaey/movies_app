import 'package:flutter/material.dart';
import 'package:movies/core/utils/app_assets.dart';
import 'package:movies/presentation/auth/provider/auth_provider.dart';
import 'package:movies/presentation/auth/widgets/app_text_form_field.dart';
import 'package:movies/presentation/widgets/app_elevated_button.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthProvider>(
      create: (context) => AuthProvider(),
      child: Consumer<AuthProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Forgot Password",
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
                      Image.asset(AppImages.forgotPassword),

                      AppTextFormField(
                        isEmail: true,
                        customKeyboardType: TextInputType.emailAddress,
                        customTextInputAction: TextInputAction.next,
                        customPrefixIcon: const Icon(Icons.email),
                        customLabel: "Email",
                        controller: provider.emailController,
                      ),
                      const SizedBox(height: 24),
                      AppElevatedButton(
                        onPress: () {},
                        text: "Send Email",
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
