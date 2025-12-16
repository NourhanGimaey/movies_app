import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'data')
  final String? data;
  @JsonKey(name: 'statusCode')
  final int? statusCode;

  LoginResponseModel({
    required this.message,
    required this.data,
    required this.statusCode,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}
