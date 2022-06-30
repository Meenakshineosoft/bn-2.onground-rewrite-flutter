import 'package:json_annotation/json_annotation.dart';
import 'package:on_ground/model/verifyotp/profile.dart';

part 'verify_otp_data.g.dart';

@JsonSerializable()
class VerifyOtpData {
  VerifyOtpData({this.profile,this.sessionToken});
  final Profile? profile;
  @JsonKey(name: "session_token")
  final String? sessionToken;

  factory VerifyOtpData.fromJson(Map<String,dynamic> json) => _$VerifyOtpDataFromJson(json);
  Map<String,dynamic> toJson() => _$VerifyOtpDataToJson(this);
}