import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/features/auth/data/models/login_request_model/login_request_model.dart';
import 'package:movies/features/auth/data/models/login_response_model/login_response_model.dart';
import 'package:movies/features/auth/domain/repositories/auth_repo.dart';

@injectable
class LoginUseCase {
  final AuthRepo _repository;
  const LoginUseCase(this._repository);

  Future<Either<String, LoginResponseModel>> call(
    LoginRequestModel loginRequest,
  ) async {
    return _repository.login(loginRequest);
  }
}
