import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final String phone;
  final bool isLoading;
  final bool isRegistrationSuccess;

  const AuthState({
    this.name = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.phone = '',
    this.isLoading = false,
    this.isRegistrationSuccess = false,
  });

  @override
  List<Object?> get props => [
    name,
    email,
    password,
    confirmPassword,
    phone,
    isLoading,
    isRegistrationSuccess,
  ];

  AuthState copyWith({
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
    String? phone,
    bool? isLoading,
    bool? isRegistrationSuccess,
  }) {
    return AuthState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.password,
      phone: phone ?? this.phone,
      isLoading: isLoading ?? this.isLoading,
      isRegistrationSuccess:
          isRegistrationSuccess ?? this.isRegistrationSuccess,
    );
  }
}
