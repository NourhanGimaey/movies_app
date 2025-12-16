// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponseModel _$RegisterResponseModelFromJson(
        Map<String, dynamic> json) =>
    RegisterResponseModel(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      statusCode: (json['statusCode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RegisterResponseModelToJson(
        RegisterResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'statusCode': instance.statusCode,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      email: json['email'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      avaterId: (json['avaterId'] as num).toInt(),
      id: json['_id'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
      'avaterId': instance.avaterId,
      '_id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
