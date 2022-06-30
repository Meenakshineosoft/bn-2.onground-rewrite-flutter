// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_otp_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendOtpData _$SendOtpDataFromJson(Map<String, dynamic> json) => SendOtpData(
      maxCountAllowed: json['max_count_allowed'] as int?,
      otpRequestedCount: json['otp_requested_count'] as int?,
      requestId: json['request_id'] as String?,
    );

Map<String, dynamic> _$SendOtpDataToJson(SendOtpData instance) =>
    <String, dynamic>{
      'max_count_allowed': instance.maxCountAllowed,
      'otp_requested_count': instance.otpRequestedCount,
      'request_id': instance.requestId,
    };
