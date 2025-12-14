import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/network/retrofit_api_client.dart';
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
  Future<Either<String, RegisterResponseModel>> register(
    RegisterRequestModel registerRequest,
  ) async {
    late RegisterResponseModel response;
    try {
      response = await _retrofitApiClient.register(registerRequest);
      return Right(response);
    } on DioException catch (dioException) {
      return Left(_handleDioErrors(dioException));
    }
  }

  String _handleDioErrors(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return "Connection time out";
      case DioExceptionType.badCertificate:
        return "Bad certificate";
      case DioExceptionType.badResponse:
        if (dioException.response?.statusCode == 409) {
          return "Email already exists";
        } else if (dioException.response?.statusCode == 400) {
          return "Bad info";
        } else {
          return "Something went wrong, PLEASE try again later";
        }
      case DioExceptionType.cancel:
        return "Request is canceled, please try again later";
      case DioExceptionType.unknown:
        return "Something went wrong, PLEASE try again later";
    }
  }

  @override
  Future<Either<String, LoginResponseModel>> login(
    LoginRequestModel loginRequest,
  ) async {
    late LoginResponseModel response;
    try {
      response = await _retrofitApiClient.login(loginRequest);
      return Right(response);
    } on DioException catch (dioException) {
      return Left(_handleDioErrors(dioException));
    }
  }
}
