import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/utils/app_assets.dart';
import 'package:movies/features/auth/presentation/widgets/app_text_form_field.dart';
import 'package:movies/core/widgets/app_elevated_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
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
              spacing: 24.h,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImages.forgotPassword),
                AppTextFormField(
                  isEmail: true,
                  customKeyboardType: TextInputType.emailAddress,
                  customTextInputAction: TextInputAction.next,
                  customPrefixIcon: const Icon(Icons.email),
                  customLabel: "Email",
                  controller: _emailController,
                ),
                AppElevatedButton(
                  onPress: () => {},
                  text: "Send Email",
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  textColor: Theme.of(context).colorScheme.onPrimary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
