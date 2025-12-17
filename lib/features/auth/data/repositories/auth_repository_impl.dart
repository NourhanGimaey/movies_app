import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/network/connectivity_checker.dart';
import 'package:movies/core/network/error_handler.dart';
import 'package:movies/features/auth/data/data_sources/remote_data_sources/auth_remote_data_source.dart';
import 'package:movies/features/auth/data/models/login_request_model/login_request_model.dart';
import 'package:movies/features/auth/data/models/login_response_model/login_response_model.dart';
import 'package:movies/features/auth/data/models/register_request_model/register_request_model.dart';
import 'package:movies/features/auth/data/models/register_response_model/register_response_model.dart';
import 'package:movies/features/auth/domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource);

  final Failure _noInternetConnection = DataSource.noInternetConnection.failure;

  @override
  Future<Either<Failure, RegisterResponseModel>> register(
    RegisterRequestModel registerRequest,
  ) async {
    if (await ConnectivityChecker.checkInternetConnection()) {
      return _authRemoteDataSource.register(registerRequest);
    } else {
      return Left(_noInternetConnection);
    }
  }

  @override
  Future<Either<Failure, LoginResponseModel>> login(
    LoginRequestModel loginRequest,
  ) async {
    if (await ConnectivityChecker.checkInternetConnection()) {
      return _authRemoteDataSource.login(loginRequest);
    } else {
      return Left(_noInternetConnection);
    }
  }
}
