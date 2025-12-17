import 'package:dartz/dartz.dart';
import 'package:movies/core/network/error_handler.dart';
import 'package:movies/features/auth/data/models/login_request_model/login_request_model.dart';
import 'package:movies/features/auth/data/models/login_response_model/login_response_model.dart';
import 'package:movies/features/auth/data/models/register_request_model/register_request_model.dart';
import 'package:movies/features/auth/data/models/register_response_model/register_response_model.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, RegisterResponseModel>> register(
    RegisterRequestModel registerRequest,
  );
  Future<Either<Failure, LoginResponseModel>> login(
    LoginRequestModel loginRequest,
  );
}
