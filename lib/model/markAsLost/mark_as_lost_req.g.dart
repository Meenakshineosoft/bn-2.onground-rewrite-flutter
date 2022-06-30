// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mark_as_lost_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarkAsLostReq _$MarkAsLostReqFromJson(Map<String, dynamic> json) =>
    MarkAsLostReq(
      brokerId: json['broker_id'] as String?,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$MarkAsLostReqToJson(MarkAsLostReq instance) =>
    <String, dynamic>{
      'broker_id': instance.brokerId,
      'reason': instance.reason,
    };
