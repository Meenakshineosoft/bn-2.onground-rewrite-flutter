// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOtpData _$VerifyOtpDataFromJson(Map<String, dynamic> json) =>
    VerifyOtpData(
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
      sessionToken: json['session_token'] as String?,
    );

Map<String, dynamic> _$VerifyOtpDataToJson(VerifyOtpData instance) =>
    <String, dynamic>{
      'profile': instance.profile,
      'session_token': instance.sessionToken,
    };
