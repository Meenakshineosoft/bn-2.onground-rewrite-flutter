import 'package:json_annotation/json_annotation.dart';

part 'mark_as_lost_req.g.dart';

@JsonSerializable()
class MarkAsLostReq {
  MarkAsLostReq({this.brokerId,this.reason});
  
  @JsonKey(name: 'broker_id')
  final String? brokerId;
  final String? reason;

  Map<String,dynamic> toJson() => _$MarkAsLostReqToJson(this);

}