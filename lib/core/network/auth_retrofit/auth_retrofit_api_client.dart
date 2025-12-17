import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/network/api_endpoint.dart';
import 'package:movies/features/auth/data/models/login_request_model/login_request_model.dart';
import 'package:movies/features/auth/data/models/login_response_model/login_response_model.dart';
import 'package:movies/features/auth/data/models/register_request_model/register_request_model.dart';
import 'package:movies/features/auth/data/models/register_response_model/register_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_retrofit_api_client.g.dart';

@singleton
@RestApi(baseUrl: AuthApiEndpoint.baseUrl)
abstract class AuthRetrofitApiClient {
  @factoryMethod
  factory AuthRetrofitApiClient(Dio dio) = _AuthRetrofitApiClient;

  @POST(AuthApiEndpoint.registerApi)
  Future<RegisterResponseModel> register(
    @Body() RegisterRequestModel registerRequest,
  );

  @POST(AuthApiEndpoint.loginApi)
  Future<LoginResponseModel> login(@Body() LoginRequestModel loginRequest);
}
