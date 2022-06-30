import 'package:json_annotation/json_annotation.dart';

part 'otp_verify_req_body.g.dart';

@JsonSerializable()
class OtpVerifyReqBody {
  OtpVerifyReqBody({
    this.otp,
    this.phoneNumber,
    this.requestId
  });
  final String? otp;
  @JsonKey(name: "phone_number")
  final String? phoneNumber;
  @JsonKey(name: "request_id")
  final String? requestId;

  Map<String,dynamic> toJson() => _$OtpVerifyReqBodyToJson(this);
}