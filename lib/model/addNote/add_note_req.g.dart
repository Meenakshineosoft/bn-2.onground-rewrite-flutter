// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_note_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddNotesReqBody _$AddNotesReqBodyFromJson(Map<String, dynamic> json) =>
    AddNotesReqBody(
      brokerId: json['broker_id'] as String?,
      data: json['data'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$AddNotesReqBodyToJson(AddNotesReqBody instance) =>
    <String, dynamic>{
      'broker_id': instance.brokerId,
      'data': instance.data,
      'type': instance.type,
    };
