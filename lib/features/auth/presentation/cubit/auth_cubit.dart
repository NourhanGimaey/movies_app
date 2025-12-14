import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart'; // Import the AuthState class

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  void submitRegister() async {
    final newName = nameController.text;
    final newEmail = emailController.text;
    final newPassword = passwordController.text;
    final newConfirmPassword = confirmPasswordController.text;
    final newPhone = phoneController.text;

    emit(state.copyWith(isLoading: true));

    emit(
      state.copyWith(
        name: newName,
        email: newEmail,
        password: newPassword,
        confirmPassword: newConfirmPassword,
        phone: newPhone,
        isLoading: false,
        isRegistrationSuccess: true,
      ),
    );
  }

  void submitLogin() {
    final newEmail = emailController.text;
    final newPassword = passwordController.text;

    emit(state.copyWith(email: newEmail, password: newPassword));
  }

  void sendPasswordResetEmail() {
    final email = emailController.text;

    emit(state.copyWith(email: email));
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    return super.close();
  }
}
