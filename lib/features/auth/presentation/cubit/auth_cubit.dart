import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/features/auth/domain/use_cases/login_use_case.dart';
import 'package:movies/features/auth/domain/use_cases/register_use_case.dart';
import 'package:movies/features/auth/presentation/cubit/auth_state.dart';
import 'package:movies/features/auth/data/models/register_request_model/register_request_model.dart';
import 'package:movies/features/auth/data/models/login_request_model/login_request_model.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final RegisterUseCase _registerUseCase;
  final LoginUseCase _loginUseCase;

  AuthCubit(this._registerUseCase, this._loginUseCase) : super(InitialState());

  Future<void> register({required RegisterRequestModel registerModel}) async {
    emit(LoadingState());
    final register = await _registerUseCase.call(registerModel);
    register.fold(
      (failure) {
        emit(ErrorState(failure));
      },
      (responseModel) {
        emit(SuccessRegisterState());
      },
    );
  }

  Future<void> login({required LoginRequestModel loginModel}) async {
    emit(LoadingState());
    final login = await _loginUseCase.call(loginModel);
    login.fold(
      (failure) {
        emit(ErrorState(failure));
      },
      (responseModel) {
        emit(SuccessLoginState());
      },
    );
  }
}
