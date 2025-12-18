import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies/core/utils/app_routes.dart';
import 'package:movies/features/auth/data/models/register_request_model/register_request_model.dart';
import 'package:movies/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:movies/features/auth/presentation/cubit/auth_state.dart';
import 'package:movies/features/auth/presentation/models/avatar_model.dart';
import 'package:movies/core/widgets/app_text_form_field.dart';
import 'package:movies/core/widgets/app_elevated_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  int _selectedAvatarId = 0;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _onRegisterPressed() {
    final cubit = context.read<AuthCubit>();
    if (_formKey.currentState!.validate()) {
      final int selectedAvatarId =
          AvatarModel.avatarModel[_selectedAvatarId].avatarId;
      cubit.register(
        registerModel: RegisterRequestModel(
          name: _nameController.text,
          email: _emailController.text,
          password: _passwordController.text,
          confirmPassword: _confirmPasswordController.text,
          phone: _phoneController.text,
          avaterId: selectedAvatarId,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
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
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SuccessRegisterState) {
            Fluttertoast.showToast(
              msg: "User created successfully.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              textColor: Theme.of(context).colorScheme.onSecondary,
              fontSize: 16.0,
            );
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.loginScreen.routeName,
            );
          } else if (state is ErrorState) {
            Fluttertoast.showToast(
              msg: state.failure.message,
              toastLength: Toast.LENGTH_SHORT,
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
              child: SingleChildScrollView(
                child: Column(
                  spacing: 24.h,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CarouselSlider.builder(
                      itemCount: AvatarModel.avatarModel.length,
                      itemBuilder:
                          (context, int currentAvatarId, int pageViewIndex) {
                            final currentAvatar =
                                AvatarModel.avatarModel[currentAvatarId];
                            return Image.asset(currentAvatar.imagePath);
                          },
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        enlargeFactor: 0.4,
                        viewportFraction: .35,
                        aspectRatio: 3,
                        initialPage: 0,
                      ),
                    ),
                    const Text("Avatar"),
                    AppTextFormField(
                      isName: true,
                      customKeyboardType: TextInputType.text,
                      customTextInputAction: TextInputAction.next,
                      customPrefixIcon: const Icon(Icons.person),
                      customLabel: "Name",
                      controller: _nameController,
                    ),
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
                      customTextInputAction: TextInputAction.next,
                      customPrefixIcon: const Icon(Icons.lock_open_rounded),
                      customLabel: "Password",
                      controller: _passwordController,
                    ),
                    AppTextFormField(
                      isConfirmPassword: true,
                      customKeyboardType: TextInputType.text,
                      customTextInputAction: TextInputAction.next,
                      customPrefixIcon: const Icon(Icons.lock_open_rounded),
                      customLabel: "Confirm Password",
                      controller: _confirmPasswordController,
                      matchPasswordController: _passwordController,
                    ),
                    AppTextFormField(
                      isPhone: true,
                      customKeyboardType: TextInputType.number,
                      customTextInputAction: TextInputAction.next,
                      customPrefixIcon: const Icon(Icons.phone_iphone),
                      customLabel: "Phone Number",
                      controller: _phoneController,
                    ),
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        final bool isLoading = state is LoadingState;
                        return isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : AppElevatedButton(
                                onPress: _onRegisterPressed,
                                text: "Create Account",
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
        ),
      ),
    );
  }
}
