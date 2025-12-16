import 'package:movies/core/network/error_handler.dart';

abstract class AuthState {}

class InitialState extends AuthState {}

class LoadingState extends AuthState {}

class ErrorState extends AuthState {
  final Failure failure;
  ErrorState(this.failure);
}

class SuccessRegisterState extends AuthState {}

class SuccessLoginState extends AuthState {} 
