
import 'package:json_annotation/json_annotation.dart';
part 'send_otp_data.g.dart';
@JsonSerializable()
class SendOtpData {
  SendOtpData(
    {
      this.maxCountAllowed,
      this.otpRequestedCount,
      this.requestId
    }
  );
  @JsonKey(name: "max_count_allowed")
  final int? maxCountAllowed;
  @JsonKey(name: "otp_requested_count")
  final int? otpRequestedCount;
  @JsonKey(name: "request_id")
  final String? requestId;

  factory SendOtpData.fromJson(Map<String,dynamic> json) => _$SendOtpDataFromJson(json);
  
}