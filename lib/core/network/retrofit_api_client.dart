import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/network/api_endpoint.dart';
import 'package:movies/features/auth/data/models/login_request_model/login_request_model.dart';
import 'package:movies/features/auth/data/models/login_response_model/login_response_model.dart';
import 'package:movies/features/auth/data/models/register_request_model/register_request_model.dart';
import 'package:movies/features/auth/data/models/register_response_model/register_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'retrofit_api_client.g.dart';

@singleton
@RestApi(baseUrl: ApiEndpoint.baseUrl)
abstract class RetrofitApiClient {
  @factoryMethod
  factory RetrofitApiClient(Dio dio) = _RetrofitApiClient;

  @POST(ApiEndpoint.registerApi)
  Future<RegisterResponseModel> register(
    @Body() RegisterRequestModel registerRequest,
  );

  @POST(ApiEndpoint.loginApi)
  Future<LoginResponseModel> login(@Body() LoginRequestModel loginRequest);
}
