import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/network/error_handler.dart';
import 'package:movies/features/auth/data/models/register_request_model/register_request_model.dart';
import 'package:movies/features/auth/data/models/register_response_model/register_response_model.dart';
import 'package:movies/features/auth/domain/repositories/auth_repository.dart';

@injectable
class RegisterUseCase {
  final AuthRepository _authRepository;
  const RegisterUseCase(this._authRepository);

  Future<Either<Failure, RegisterResponseModel>> call(
    RegisterRequestModel registerRequest,
  ) async {
    return _authRepository.register(registerRequest);
  }
}
