import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies/core/utils/app_assets.dart';
import 'package:movies/core/utils/app_routes.dart';
import 'package:movies/features/auth/data/models/login_request_model/login_request_model.dart';
import 'package:movies/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:movies/features/auth/presentation/cubit/auth_state.dart';
import 'package:movies/core/widgets/app_text_form_field.dart';
import 'package:movies/core/widgets/app_elevated_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    final cubit = context.read<AuthCubit>();
    if (_formKey.currentState!.validate()) {
      cubit.login(
        loginModel: LoginRequestModel(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SuccessLoginState) {
            Fluttertoast.showToast(
              msg: "Successful login!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              textColor: Theme.of(context).colorScheme.onSecondary,
              fontSize: 16.0,
            );
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.mainLayout.routeName,
            );
          } else if (state is ErrorState) {
            Fluttertoast.showToast(
              msg: state.failure.message,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              backgroundColor: Theme.of(context).colorScheme.error,
              textColor: Theme.of(context).colorScheme.onError,
              fontSize: 16.0,
            );
          }
        },
        child: Form(
          key: _formKey,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                spacing: 24.h,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppImages.appLogo, width: 160),
                  AppTextFormField(
                    isEmail: true,
                    customKeyboardType: TextInputType.emailAddress,
                    customTextInputAction: TextInputAction.next,
                    customPrefixIcon: const Icon(Icons.email),
                    customLabel: "Email",
                    controller: _emailController,
                  ),
                  AppTextFormField(
                    isPassword: true,
                    customKeyboardType: TextInputType.text,
                    customTextInputAction: TextInputAction.done,
                    customPrefixIcon: const Icon(Icons.lock_open_rounded),
                    customLabel: "Password",
                    controller: _passwordController,
                  ),
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
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      final bool isLoading = state is LoadingState;
                      return isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : AppElevatedButton(
                              onPress: _onLoginPressed,
                              text: "Login",
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.secondary,
                              textColor: Theme.of(
                                context,
                              ).colorScheme.onPrimary,
                            );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have account?",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
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
                                color: Theme.of(context).colorScheme.secondary,
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
                                color: Theme.of(context).colorScheme.secondary,
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
                  AppElevatedButton(
                    onPress: () {},
                    text: "Login with Google",
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    textColor: Theme.of(context).colorScheme.onPrimary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
