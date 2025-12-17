import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/network/error_handler.dart';
import 'package:movies/core/network/auth_retrofit/auth_retrofit_api_client.dart';
import 'package:movies/features/auth/data/data_sources/remote_data_sources/remote_data_source.dart';
import 'package:movies/features/auth/data/models/login_request_model/login_request_model.dart';
import 'package:movies/features/auth/data/models/login_response_model/login_response_model.dart';
import 'package:movies/features/auth/data/models/register_request_model/register_request_model.dart';
import 'package:movies/features/auth/data/models/register_response_model/register_response_model.dart';

@LazySingleton(as: RemoteDataSource)
class RemoteDataSourceImpl implements RemoteDataSource {
  final RetrofitApiClient _retrofitApiClient;
  const RemoteDataSourceImpl(this._retrofitApiClient);

  @override
  Future<Either<Failure, RegisterResponseModel>> register(
    RegisterRequestModel registerRequest,
  ) async {
    try {
      final response = await _retrofitApiClient.register(registerRequest);
      return Right(response);
    } catch (e) {
      final errorHandler = ErrorHandler.handle(e);
      return Left(errorHandler.failure);
    }
  }

  @override
  Future<Either<Failure, LoginResponseModel>> login(
    LoginRequestModel loginRequest,
  ) async {
    try {
      final response = await _retrofitApiClient.login(loginRequest);
      return Right(response);
    } catch (e) {
      final errorHandler = ErrorHandler.handle(e);
      return Left(errorHandler.failure);
    }
  }
}
