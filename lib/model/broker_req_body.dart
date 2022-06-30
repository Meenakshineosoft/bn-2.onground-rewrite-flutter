import 'package:json_annotation/json_annotation.dart';

part 'broker_req_body.g.dart';

@JsonSerializable()
class WhitelistReqBody {
  WhitelistReqBody({
    this.assignTo,
    this.brokerName,
    this.firmAddress,
    this.organisationName,
    this.phoneNumber,
    this.placeId,
    this.polygonUUID,
  });
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @JsonKey(name: "polygon_uuid")
  final String? polygonUUID;
  @JsonKey(name: "broker_name")
  final String? brokerName;
  @JsonKey(name: "organization_name")
  final String? organisationName;
  @JsonKey(name: "firm_address")
  final String? firmAddress;
  @JsonKey(name: "place_id")
  final String? placeId;
  @JsonKey(name: "assign_to")
  final String? assignTo;

  Map<String,dynamic> toJson() => _$WhitelistReqBodyToJson(this);
}