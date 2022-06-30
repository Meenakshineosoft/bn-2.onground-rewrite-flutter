// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_verify_req_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpVerifyReqBody _$OtpVerifyReqBodyFromJson(Map<String, dynamic> json) =>
    OtpVerifyReqBody(
      otp: json['otp'] as String?,
      phoneNumber: json['phone_number'] as String?,
      requestId: json['request_id'] as String?,
    );

Map<String, dynamic> _$OtpVerifyReqBodyToJson(OtpVerifyReqBody instance) =>
    <String, dynamic>{
      'otp': instance.otp,
      'phone_number': instance.phoneNumber,
      'request_id': instance.requestId,
    };
