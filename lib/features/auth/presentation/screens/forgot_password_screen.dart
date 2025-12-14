import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/app_assets.dart';
import 'package:movies/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:movies/features/auth/presentation/cubit/auth_state.dart';
import 'package:movies/features/auth/presentation/widgets/app_text_form_field.dart';
import 'package:movies/core/widgets/app_elevated_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ForgotPasswordScreen({super.key});
  void _onSendEmailPressed(BuildContext context) {
    if (_formKey.currentState?.validate() == true) {
      final authCubit = context.read<AuthCubit>();
      
      authCubit.sendPasswordResetEmail();

    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(),
      child: Scaffold(
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
        
        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            final authCubit = context.read<AuthCubit>();
            
            return Form(
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
                        controller: authCubit.emailController,
                      ),
                      const SizedBox(height: 24),
                      AppElevatedButton(
                        onPress: () => _onSendEmailPressed(context),
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
            );
          },
        ),
      ),
    );
  }
}