// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brokers_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrokersData _$BrokersDataFromJson(Map<String, dynamic> json) => BrokersData(
      assignedOnEpoch: json['assigned_on_epoch'] as int?,
      brokerId: json['broker_id'] as int?,
      brokerTypeId: json['broker_type_id'] as String?,
      firmAddress: json['firm_address'] as String?,
      gstNumber: json['gst_number'] as String?,
      history: (json['history'] as List<dynamic>?)
          ?.map((e) => History.fromJson(e as Map<String, dynamic>))
          .toList(),
      isMarkedLost: json['is_marked_lost'] as bool?,
      lastActiveAt: json['last_active_at'] as int?,
      lastActiveAtInDays: json['last_active_at_in_days'] as int?,
      lastActivity: json['last_activity'] as int?,
      lastPost: json['last_post'] as bool?,
      lastPostDays: json['last_post_days'] as int?,
      lostReason: json['lost_reason'] as String?,
      name: json['name'] as String?,
      orgName: json['org_name'] as String?,
      orgUuid: json['org_uuid'] as String?,
      phoneNumber: json['phone_number'] as String?,
      polygonId: json['polygon_id'] as int?,
      profilePicUrl: json['profile_pic_url'] as String?,
      reason: json['reason'] as String?,
      reraId: json['rera_id'] as String?,
      snoozed: json['snoozed'] as bool?,
      snoozedTill: json['snoozed_till'] as String?,
      snoozedTillEpoch: json['snoozed_till_epoch'] as String?,
      uninstalled: json['uninstalled'] as bool?,
      userId: json['user_id'] as int?,
    );

Map<String, dynamic> _$BrokersDataToJson(BrokersData instance) =>
    <String, dynamic>{
      'assigned_on_epoch': instance.assignedOnEpoch,
      'broker_id': instance.brokerId,
      'broker_type_id': instance.brokerTypeId,
      'firm_address': instance.firmAddress,
      'gst_number': instance.gstNumber,
      'history': instance.history,
      'is_marked_lost': instance.isMarkedLost,
      'last_active_at': instance.lastActiveAt,
      'last_active_at_in_days': instance.lastActiveAtInDays,
      'last_activity': instance.lastActivity,
      'last_post': instance.lastPost,
      'last_post_days': instance.lastPostDays,
      'lost_reason': instance.lostReason,
      'name': instance.name,
      'org_name': instance.orgName,
      'org_uuid': instance.orgUuid,
      'phone_number': instance.phoneNumber,
      'polygon_id': instance.polygonId,
      'profile_pic_url': instance.profilePicUrl,
      'reason': instance.reason,
      'rera_id': instance.reraId,
      'snoozed': instance.snoozed,
      'snoozed_till': instance.snoozedTill,
      'snoozed_till_epoch': instance.snoozedTillEpoch,
      'uninstalled': instance.uninstalled,
      'user_id': instance.userId,
    };
