import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/features/auth/data/models/register_request_model/register_request_model.dart';
import 'package:movies/features/auth/data/models/register_response_model/register_response_model.dart';
import 'package:movies/features/auth/domain/repositories/auth_repo.dart';

@injectable
class RegisterUseCase {
  final AuthRepo _repository;
  const RegisterUseCase(this._repository);

  Future<Either<String, RegisterResponseModel>> call(
    RegisterRequestModel registerRequest,
  ) async {
    return _repository.register(registerRequest);
  }
}
