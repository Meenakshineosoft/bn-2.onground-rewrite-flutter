// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'broker_req_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WhitelistReqBody _$WhitelistReqBodyFromJson(Map<String, dynamic> json) =>
    WhitelistReqBody(
      assignTo: json['assign_to'] as String?,
      brokerName: json['broker_name'] as String?,
      firmAddress: json['firm_address'] as String?,
      organisationName: json['organization_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      placeId: json['place_id'] as String?,
      polygonUUID: json['polygon_uuid'] as String?,
    );

Map<String, dynamic> _$WhitelistReqBodyToJson(WhitelistReqBody instance) =>
    <String, dynamic>{
      'phone_number': instance.phoneNumber,
      'polygon_uuid': instance.polygonUUID,
      'broker_name': instance.brokerName,
      'organization_name': instance.organisationName,
      'firm_address': instance.firmAddress,
      'place_id': instance.placeId,
      'assign_to': instance.assignTo,
    };
